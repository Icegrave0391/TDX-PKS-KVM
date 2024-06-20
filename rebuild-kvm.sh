#!/bin/bash

LINUX_FOLDER="linux-intel-6.8.0"

cp ./kvm/mmu/* ./$LINUX_FOLDER/arch/x86/kvm/mmu/
cp ./kvm/vmx/* ./$LINUX_FOLDER/arch/x86/kvm/vmx/
cp ./kvm/*.c   ./$LINUX_FOLDER/arch/x86/kvm/
cp ./kvm/*.h   ./$LINUX_FOLDER/arch/x86/kvm/

pushd $LINUX_FOLDER
make modules -j`nproc`

if [ $? -eq 0 ]
then
sudo rmmod kvm-intel
sudo rmmod kvm

sudo insmod ./arch/x86/kvm/kvm.ko
sudo insmod ./arch/x86/kvm/kvm-intel.ko
fi

popd