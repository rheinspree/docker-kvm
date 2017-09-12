# QEMU/KVM on Docker and CoreOS

## Usage

0. `docker pull ianblenke/kvm`
0. `docker run --privileged ianblenke/kvm /usr/bin/kvm QEMU_OPTIONS`

Note that `--privileged` is required in order to run with the kernel-level virtualization (kvm) optimization.


## Background
For the most part, it is fairly easy to run kvm within docker.  The only real hiccup is that /dev/kvm (the device node for the kernel hypervisor access) isn't reissued (or permitted) within docker.  That means we have to do two things for basic usage:

0.  Make the device node
0.  Execute the docker container with `--privileged`

While this is obviously not ideal, it isn't actually _that_ bad, since you are running a full VM, in the container, which _itself_ should isolate the client.

## Why

Sometimes you need to orchestrate immutable windows instances, and Windows Server Containers aren't available yet.

## Service file

Also included in this repo is a service file, suitable for use with systemd (CoreOS and fleet), provided as an example.  You'll need to fill in your own values, of course, and customize it to your liking.

