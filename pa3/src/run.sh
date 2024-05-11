#!/bin/sh
function run_case() {
	CASE_ID=$1
	rm -f ../results/c${CASE_ID}.log
	echo "running cmd: ./atpg -tdfsim ../tdf_patterns/c${CASE_ID}.pat ../sample_circuits/c${CASE_ID}.ckt > ../results/c${CASE_ID}.log"
	./atpg -tdfsim ../tdf_patterns/c${CASE_ID}.pat ../sample_circuits/c${CASE_ID}.ckt > ../results/c${CASE_ID}.log
	echo "Diff result:"
	diff ../results/c${CASE_ID}.log ../results/c${CASE_ID}_golden.log
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
