#! /bin/bash
#

modes='rndwr seqrd seqrewr'
no=5
File=fileioTest_docker_output.txt

echo FILEIO TEST DOCKER > $File

for mode in $modes;  do
echo $filecommand

for(( i = 1; i <= no; i++ ))
do
	echo Test $i started in mode $mode >> $File
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode prepare
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode run >> $File
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode cleanup
	echo Test $i done >> $File
	echo Clearing cache >> $File
sync && sudo purge
done
done
