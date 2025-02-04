# TDX-PKS-KVM

The host Linux/KVM settings with Intel TDX and Intel PKS virtualization support for TD guest confidential VMs (CVMs). 

This is to support a full-functional deployment of our EuroSys'25 paper "Erebor: A Drop-In Sandbox Solution for Private Data Processing in Untrusted Confidential Virtual Machines".

```bash
git pull
git submodule update --init --recursive
```


## Pre-reqs
Linux kernel build dependencies:
```bash
sudo apt-get build-dep linux linux-image-$(uname -r)
sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm
```

* An ability to improvise

* A fighting spirit

* Some understanding of how to update your BIOS

* A BIOS without secure boot!

## Build

To build the host Linux, please execute the following command:

```bash
# build and install the kernel
./build-kernel.sh
```

After that, please kindly edit your `/etc/default/grub` and execute `sudo update-grub` to boot the new kernel.

## If you want to customize KVM (optional)

After building and installing the Linux, your KVM should be able to support Intel PKS virtualization inside TD guests. If you want to patch the KVM and support new features, do the following steps:

1) Copy the modified KVM files (under `linux/arch/x86/kvm`) to `kvm/` (under the root directory of this repo).
2) Run `sudo ./rebuild-kvm.sh`.
