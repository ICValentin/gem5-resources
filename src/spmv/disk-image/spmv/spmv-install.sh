# Copyright (c) 2020 The Regents of the University of California.
# SPDX-License-Identifier: BSD 3-Clause

cd /home/gem5/
su gem5

#sudo apt install -y debconf-utils
#sudo debconf-get-selections | grep restart-without-asking > libs.txt
#sed -i 's/false/true/g' libs.txt
#while read line; do echo $line | sudo debconf-set-selections; done < libs.txt
#sudo rm libs.txt

#sudo apt install -y git
sudo apt install -y zip
sudo apt install -y unzip
sudo apt install -y gcc
#echo "12345" | sudo apt-get install -y build-essential libboost-all-dev

unzip spmv.zip


mv /home/gem5/serial-getty@.service /lib/systemd/system/

mv /home/gem5/m5 /sbin
ln -s /sbin/m5 /sbin/gem5


cd /home/gem5/spmv

# Read workload file
m5 readfile > workloadfile
echo "Done reading workloads"

# Read the name of the workload, the matrix name
read -r workload matrix < workloadfile
sed -i -e 's/__A_MATRIX_HEADER__/'$matrix'/g' $workload.c;
gcc -Wall -ansi $workload.c -o $workload;
m5 exit

cd ..
sed -i -e 's/__A_WORKLOAD__/'$workload'/g' runscript.sh;
# copy and run outside (host) script after booting
cat /home/gem5/runscript.sh >> /root/.bashrc

echo 'Installation Done'
