bash clean.sh
echo "*** Running Iterative Synthesis ***"

echo "BTOR_OPT_INCREMENTAL=1 python3 ../common/iterate.py blur.json"
# BTOR_OPT_INCREMENTAL=1 python3 ../common/iterate.py blur.json

python3 ../common/iterate.py blur.json
