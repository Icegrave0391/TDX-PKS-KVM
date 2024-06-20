#!/bin/bash

LINUX_FOLDER="linux-intel-6.8.0"

# prepare kernel configs
cp config-tdx ./$LINUX_FOLDER/.config

# prepare modified KVM sources
cp ./kvm/mmu/* ./$LINUX_FOLDER/arch/x86/kvm/mmu/
cp ./kvm/vmx/* ./$LINUX_FOLDER/arch/x86/kvm/vmx/
cp ./kvm/*.c   ./$LINUX_FOLDER/arch/x86/kvm/
cp ./kvm/*.h   ./$LINUX_FOLDER/arch/x86/kvm/

# build kernel
pushd $LINUX_FOLDER
make -j`nproc`
sudo make -j`nproc` modules_install
sudo make -j`nproc` install
popd