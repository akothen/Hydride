import tensorflow as tf
import tensorflow_hub as hub
from tensorflow.lite.python.util import run_graph_optimizations, get_grappler_config
from tensorflow.python.framework.convert_to_constants import convert_variables_to_constants_v2_as_graph
import os


def main():
    os.environ["CUDA_VISIBLE_DEVICES"] = "-1"


    IMAGE_SHAPE = (224, 224)

    model = tf.keras.Sequential([
        hub.KerasLayer("https://tfhub.dev/google/tf2-preview/mobilenet_v2/classification/4", input_shape=IMAGE_SHAPE+(3,))
    ])
        

    fff = tf.function(model).get_concrete_function(tf.TensorSpec([1, 224, 224, 3], tf.float32))
    frozen_func, graph_def = convert_variables_to_constants_v2_as_graph(fff)

    input_tensors = [
        tensor for tensor in frozen_func.inputs
        if tensor.dtype != tf.resource
    ]
    output_tensors = frozen_func.outputs

    graph_def = run_graph_optimizations(
        graph_def,
        input_tensors,
        output_tensors,
        config=get_grappler_config(['pruning', 'function', 'constfold', 'shape', 'remap', 'memory', 'common_subgraph_elimination', 'arithmetic', 'loop', 'dependency', 'debug_stripper']),
        graph=frozen_func.graph)

    tf_mlir_graph = tf.mlir.experimental.convert_graph_def(graph_def, pass_pipeline='tf-standard-pipeline')
    outfile = open('conv_2.mlir', 'wb')
    outfile.write(tf_mlir_graph.encode())
    outfile.close()


if __name__ == "__main__":
    main()