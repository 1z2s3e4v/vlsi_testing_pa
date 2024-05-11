#!/bin/sh
function run_case() {
	CASE_ID=$1
	rm -f ../pattern/c${CASE_ID}.ptn
	echo "running cmd: ./golden_tdfsim -tdfsim ../tdf_patterns/c${CASE_ID}.pat ../sample_circuits/c${CASE_ID}.ckt > ../results/c${CASE_ID}_golden.log"
	./golden_tdfsim -tdfsim ../tdf_patterns/c${CASE_ID}.pat ../sample_circuits/c${CASE_ID}.ckt > ../results/c${CASE_ID}_golden.log
	#echo "Diff result:"
	#diff ../pattern/c${CASE_ID}.ptn ../pattern/golden_c${CASE_ID}.ptn
}
all_case=( 17 432 499 880 1355 2670 3540 6288 7552 )

if [ $# -ne 0 ]; then
	if [ $1 == "all" ]; then
		for CASE_ID in ${all_case[@]}
		do
			run_case $CASE_ID
		done
	else
		CASE_ID=$1
		run_case $CASE_ID
	fi
else
	echo "Usage: ./run.sh <case_id>";
	exit
fi
