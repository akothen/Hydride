bash clean.sh
echo "*** Running Iterative Synthesis ***"

echo "python3 ../common/iterate.py sum.json"
# BTOR_OPT_INCREMENTAL=1 python3 ../common/iterate.py blur.json

python3 ../common/iterate.py sum.json
