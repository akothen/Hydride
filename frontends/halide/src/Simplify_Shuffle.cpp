#include "Deinterleave.h"
#include "Simplify_Internal.h"

namespace Halide {
namespace Internal {

using std::vector;

Expr Simplify::visit(const Shuffle *op, ExprInfo *bounds) {
    if (op->is_extract_element()) {
        int index = op->indices[0];
        internal_assert(index >= 0);
        for (const Expr &vector : op->vectors) {
            if (index < vector.type().lanes()) {
                if (vector.as<Variable>()) {
                    // If we try to extract_lane of a variable, we'll just get
                    // the same shuffle back.
                    break;
                } else {
                    return extract_lane(mutate(vector, bounds), index);
                }
            }
            index -= vector.type().lanes();
        }
    }

    // Mutate the vectors
    vector<Expr> new_vectors;
    bool changed = false;
    for (const Expr &vector : op->vectors) {
        ExprInfo v_bounds;
        Expr new_vector = mutate(vector, &v_bounds);
        if (!vector.same_as(new_vector)) {
            changed = true;
        }
        if (bounds) {
            if (new_vectors.empty()) {
                *bounds = v_bounds;
            } else {
                bounds->min_defined &= v_bounds.min_defined;
                bounds->max_defined &= v_bounds.max_defined;
                bounds->min = std::min(bounds->min, v_bounds.min);
                bounds->max = std::max(bounds->max, v_bounds.max);
                bounds->alignment = ModulusRemainder::unify(bounds->alignment, v_bounds.alignment);
            }
        }
        new_vectors.push_back(new_vector);
    }


    // Simplify slice  contigous vectors of input into
    // loading the specific slice indices 
    //if (const Load *first_load = new_vectors[0].as<Load>()) {

        // TODO: Add condition when target is HVX and the load is on 1024




        /*
        std::vector<unsigned> efficient_target_load_sizes;


        const char* hydride_target = getenv("HYDRIDE_TARGET");
        if(hydride_target && strcmp(hydride_target, "x86") == 0){
            efficient_target_load_sizes.push_back(128);
            efficient_target_load_sizes.push_back(256);
            efficient_target_load_sizes.push_back(512);
        }

        if(hydride_target && strcmp(hydride_target, "hvx") == 0){
            debug(1) << "================================\n\n";
            debug(1) << "Hydride target = hvx!\n";
            debug(1) << "================================\n\n";
            efficient_target_load_sizes.push_back(1024);
            efficient_target_load_sizes.push_back(2048);
        }
        

        size_t sliced_bits = op->type.lanes() * op->type.bits();

        bool simplify_load = false; 

        for(unsigned size : efficient_target_load_sizes){
            if (sliced_bits % size == 0){
                simplify_load = true;
            }
        }*/


        /*
        if( op->is_slice() && op->slice_stride() == 1){
            debug(1) << "Load Index: " << first_load->index << "\n";
            debug(1) << "Index lanes: " << first_load->index.type().lanes() << "\n";
            debug(1) << "Load Predicate: " << first_load->predicate << "\n";
            debug(1) << "Slice stride: "<< op->slice_stride() << "\n";
            debug(1) << "Slice begin: " << op->slice_begin() << "\n";
            debug(1) << "Slice lanes: " << op->type.lanes() << "\n";
            Expr sliced_index = Shuffle::make_slice(first_load->index,  op->slice_begin(), op->slice_stride(), op->type.lanes());
            Expr sliced_predicate = Shuffle::make_slice(first_load->predicate, op->slice_begin(), op->slice_stride(), op->type.lanes());

            debug(1) << "Sliced_index:" << sliced_index << "\n";
            debug(1) << "Sliced predicate: " << sliced_predicate << "\n";
            Expr sliced_load =  Load::make(first_load->type.with_lanes(op->type.lanes()), first_load->name, mutate(sliced_index, nullptr), first_load->image, first_load->param, mutate(sliced_predicate, nullptr), first_load->alignment);

            debug(0) << "Simplified sliced load to: " << sliced_load << "\n";
            return mutate(sliced_load, nullptr);
        }*/

        /*if(!simplify_load){
            return op;
        }*/
    //}

    // Try to convert a load with shuffled indices into a
    // shuffle of a dense load.
    if (const Load *first_load = new_vectors[0].as<Load>() ) {
        vector<Expr> load_predicates;
        vector<Expr> load_indices;
        bool unpredicated = true;
        for (const Expr &e : new_vectors) {
            const Load *load = e.as<Load>();
            if (load && load->name == first_load->name) {
                load_predicates.push_back(load->predicate);
                load_indices.push_back(load->index);
                unpredicated = unpredicated && is_const_one(load->predicate);
            } else {
                break;
            }
        }

        if (load_indices.size() == new_vectors.size()) {
            Type t = load_indices[0].type().with_lanes(op->indices.size());
            Expr shuffled_index = Shuffle::make(load_indices, op->indices);
            ExprInfo shuffled_index_info;
            shuffled_index = mutate(shuffled_index, &shuffled_index_info);
            if (shuffled_index.as<Ramp>()) {
                ExprInfo base_info;
                if (const Ramp *r = shuffled_index.as<Ramp>()) {
                    mutate(r->base, &base_info);
                }

                ModulusRemainder alignment =
                    ModulusRemainder::intersect(base_info.alignment, shuffled_index_info.alignment);

                Expr shuffled_predicate;
                if (unpredicated) {
                    shuffled_predicate = const_true(t.lanes());
                } else {
                    shuffled_predicate = Shuffle::make(load_predicates, op->indices);
                    shuffled_predicate = mutate(shuffled_predicate, nullptr);
                }
                t = first_load->type;
                t = t.with_lanes(op->indices.size());
                debug(0) << "Converting load with shuffled indices into shuffle of a dense load" <<"\n";
                return Load::make(t, first_load->name, shuffled_index, first_load->image,
                                  first_load->param, shuffled_predicate, alignment);
            }
        }
    }



    /*
    if (const Ramp *first_ramp = new_vectors[0].as<Ramp>()) {

        if(op->is_slice() && op->slice_stride() == 1){
            Expr slice_before = Shuffle::make_slice(op->vectors[0], op->slice_begin(), op->slice_stride(), op->type.lanes());
            debug(1) << "Slice Before: " << slice_before << "\n"; 
            Expr new_base = first_ramp->base + (op->slice_begin() * first_ramp->stride);
            Expr new_stride = first_ramp -> stride;
            int new_lanes = op->type.lanes();
            Expr new_ramp = Ramp::make(new_base, new_stride, new_lanes);
            debug(1) << "New Ramp: "<< new_ramp << "\n";
            return mutate(new_ramp, nullptr);
        }
    }*/


    // Try to collapse a shuffle of broadcasts into a single
    // broadcast. Note that it doesn't matter what the indices
    // are.
    const Broadcast *b1 = new_vectors[0].as<Broadcast>();
    if (b1) {
        bool can_collapse = true;
        for (size_t i = 1; i < new_vectors.size() && can_collapse; i++) {
            if (const Broadcast *b2 = new_vectors[i].as<Broadcast>()) {
                Expr check = mutate(b1->value - b2->value, nullptr);
                can_collapse &= is_const_zero(check);
            } else {
                can_collapse = false;
            }
        }
        if (can_collapse) {
            if (op->indices.size() == 1) {
                return b1->value;
            } else {
                return Broadcast::make(b1->value, op->indices.size());
            }
        }
    }

    if (op->is_interleave()) {
        int terms = (int)new_vectors.size();

        // Try to collapse an interleave of ramps into a single ramp.
        const Ramp *r = new_vectors[0].as<Ramp>();
        if (r) {
            bool can_collapse = true;
            for (size_t i = 1; i < new_vectors.size() && can_collapse; i++) {
                // If we collapse these terms into a single ramp,
                // the new stride is going to be the old stride
                // divided by the number of terms, so the
                // difference between two adjacent terms in the
                // interleave needs to be a broadcast of the new
                // stride.
                Expr diff = mutate(new_vectors[i] - new_vectors[i - 1], nullptr);
                const Broadcast *b = diff.as<Broadcast>();
                if (b) {
                    Expr check = mutate(b->value * terms - r->stride, nullptr);
                    can_collapse &= is_const_zero(check);
                } else {
                    can_collapse = false;
                }
            }
            if (can_collapse) {
                return mutate(Ramp::make(r->base, r->stride / terms, r->lanes * terms), bounds);
            }
        }

        // Try to collapse an interleave of slices of vectors from
        // the same vector into a single vector.
        if (const Shuffle *first_shuffle = new_vectors[0].as<Shuffle>()) {
            if (first_shuffle->is_slice()) {
                bool can_collapse = true;
                for (size_t i = 0; i < new_vectors.size() && can_collapse; i++) {
                    const Shuffle *i_shuffle = new_vectors[i].as<Shuffle>();

                    // Check that the current shuffle is a slice...
                    if (!i_shuffle || !i_shuffle->is_slice()) {
                        can_collapse = false;
                        break;
                    }

                    // ... and that it is a slice in the right place...
                    // If the shuffle is a single element, we don't care what the stride is.
                    if (i_shuffle->slice_begin() != (int)i ||
                        (i_shuffle->indices.size() != 1 && i_shuffle->slice_stride() != terms)) {
                        can_collapse = false;
                        break;
                    }

                    if (i > 0) {
                        // ... and that the vectors being sliced are the same.
                        if (first_shuffle->vectors.size() != i_shuffle->vectors.size()) {
                            can_collapse = false;
                            break;
                        }

                        for (size_t j = 0; j < first_shuffle->vectors.size() && can_collapse; j++) {
                            if (!equal(first_shuffle->vectors[j], i_shuffle->vectors[j])) {
                                can_collapse = false;
                            }
                        }
                    }
                }

                if (can_collapse) {
                    debug(0) << "Make concat in can_collapse\n";
                    // It's possible the slices didn't use all of the vector, in which case we need to slice it.
                    Expr result = Shuffle::make_concat(first_shuffle->vectors);
                    if (result.type().lanes() != op->type.lanes()) {
                        result = Shuffle::make_slice(result, 0, 1, op->type.lanes());
                    }
                    return result;
                }
            }
        }
    } else if (op->is_concat()) {
        // Try to collapse a concat of ramps into a single ramp.
        const Ramp *r = new_vectors[0].as<Ramp>();
        if (r) {
            bool can_collapse = true;
            for (size_t i = 1; i < new_vectors.size() && can_collapse; i++) {
                Expr diff;
                if (new_vectors[i].type().lanes() == new_vectors[i - 1].type().lanes()) {
                    diff = mutate(new_vectors[i] - new_vectors[i - 1], nullptr);
                }

                const Broadcast *b = diff.as<Broadcast>();
                if (b) {
                    Expr check = mutate(b->value - r->stride * new_vectors[i - 1].type().lanes(), nullptr);
                    can_collapse &= is_const_zero(check);
                } else {
                    can_collapse = false;
                }
            }
            if (can_collapse) {
                return Ramp::make(r->base, r->stride, op->indices.size());
            }
        }

        // Try to collapse a concat of scalars into a ramp.
        if (new_vectors[0].type().is_scalar() && new_vectors[1].type().is_scalar()) {
            bool can_collapse = true;
            Expr stride = mutate(new_vectors[1] - new_vectors[0], nullptr);
            for (size_t i = 1; i < new_vectors.size() && can_collapse; i++) {
                if (!new_vectors[i].type().is_scalar()) {
                    can_collapse = false;
                    break;
                }

                Expr check = mutate(new_vectors[i] - new_vectors[i - 1] - stride, nullptr);
                if (!is_const_zero(check)) {
                    can_collapse = false;
                }
            }

            if (can_collapse) {
                return Ramp::make(new_vectors[0], stride, op->indices.size());
            }
        }
    }

    // Pull a widening cast outside of a slice
    if (new_vectors.size() == 1 &&
        op->type.lanes() < new_vectors[0].type().lanes()) {
        if (const Cast *cast = new_vectors[0].as<Cast>()) {
            if (cast->type.bits() > cast->value.type().bits()) {
                return mutate(Cast::make(cast->type.with_lanes(op->type.lanes()),
                                         Shuffle::make({cast->value}, op->indices)),
                              bounds);
            }
        }
    }

    if (op->is_slice() && (new_vectors.size() == 1)) {
        if (const Shuffle *inner_shuffle = new_vectors[0].as<Shuffle>()) {
            // Try to collapse a slice of slice.
            if (inner_shuffle->is_slice() && (inner_shuffle->vectors.size() == 1)) {
                // Indices of the slice are ramp, so nested slice is a1 * (a2 * x + b2) + b1 =
                // = a1 * a2 * x + a1 * b2 + b1.
                return Shuffle::make_slice(inner_shuffle->vectors[0],
                                           op->slice_begin() * inner_shuffle->slice_stride() + inner_shuffle->slice_begin(),
                                           op->slice_stride() * inner_shuffle->slice_stride(),
                                           op->indices.size());
            }
            // Check if we really need to concat all vectors before slicing.
            if (inner_shuffle->is_concat()) {
                int slice_min = op->indices.front();
                int slice_max = op->indices.back();
                int concat_index = 0;
                int new_slice_start = -1;
                vector<Expr> new_concat_vectors;
                for (const auto &v : inner_shuffle->vectors) {
                    // Check if current concat vector overlaps with slice.
                    if ((concat_index >= slice_min && concat_index <= slice_max) ||
                        ((concat_index + v.type().lanes() - 1) >= slice_min && (concat_index + v.type().lanes() - 1) <= slice_max)) {
                        if (new_slice_start < 0) {
                            new_slice_start = concat_index;
                        }
                        new_concat_vectors.push_back(v);
                    }

                    concat_index += v.type().lanes();
                }
                if (new_concat_vectors.size() < inner_shuffle->vectors.size() && new_concat_vectors.size() != 0) {
                    debug(0) << "Make concat in new_concat_vectors\n";
                    return Shuffle::make_slice(Shuffle::make_concat(new_concat_vectors), op->slice_begin() - new_slice_start, op->slice_stride(), op->indices.size());
                }
            }
        }
    }

    if (!changed) {
        return op;
    } else {
        return Shuffle::make(new_vectors, op->indices);
    }
}

template<typename T>
Expr Simplify::hoist_slice_vector(Expr e) {
    const T *op = e.as<T>();
    internal_assert(op);

    const Shuffle *shuffle_a = op->a.template as<Shuffle>();
    const Shuffle *shuffle_b = op->b.template as<Shuffle>();

    internal_assert(shuffle_a && shuffle_b &&
                    shuffle_a->is_slice() &&
                    shuffle_b->is_slice());

    if (shuffle_a->indices != shuffle_b->indices) {
        return e;
    }

    const std::vector<Expr> &slices_a = shuffle_a->vectors;
    const std::vector<Expr> &slices_b = shuffle_b->vectors;
    if (slices_a.size() != slices_b.size()) {
        return e;
    }

    for (size_t i = 0; i < slices_a.size(); i++) {
        if (slices_a[i].type() != slices_b[i].type()) {
            return e;
        }
    }

    vector<Expr> new_slices;
    for (size_t i = 0; i < slices_a.size(); i++) {
        new_slices.push_back(T::make(slices_a[i], slices_b[i]));
    }

    return Shuffle::make(new_slices, shuffle_a->indices);
}

template Expr Simplify::hoist_slice_vector<Add>(Expr);
template Expr Simplify::hoist_slice_vector<Sub>(Expr);
template Expr Simplify::hoist_slice_vector<Mul>(Expr);
template Expr Simplify::hoist_slice_vector<Min>(Expr);
template Expr Simplify::hoist_slice_vector<Max>(Expr);

}  // namespace Internal
}  // namespace Halide
