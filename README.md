# take me back
> I miss the old libc

## What is this? 🧐
With [updates in glibc 2.34](https://sourceware.org/git/?p=glibc.git;a=commit;h=035c012e32c11e84d64905efaf55e74f704d3668), getting basic ROP gadgets inside your binaries is harder, which is good for security, but makes learning the basics of binary exploitation a bit more annoying. This small Docker container spins up an Ubuntu image with an older version of glibc, so that you don't have to download a bunch of things yourself. It will also copy the libc and linker out of the Docker container for added convenience.

This project is solely intended for small, typically single file C programs to be used in CTF-style challenges, nothing more.

## Usage 🐳
**Prerequisites:** [Docker](https://docs.docker.com/engine/install/)
```shell
docker run --rm -it -v "$PWD:/pwd" take-me-back [GCC FLAGS]
```

### Example
```shell
docker run --rm -it -v "$PWD:/pwd" take-me-back vuln.c -o vuln -fno-stack-protector -z execstack -no-pie
```

## TODO 📋
- [ ] Figure out a clean way to allow someone to specify the glibc version they need
- [x] ~~maybe write a Python wrapper to handle the whole file path issue?~~ `WORKDIR` is a thing dummy
- [ ] Use a smaller base image, maybe Arch Linux or [alpine-glibc](https://hub.docker.com/r/frolvlad/alpine-glibc)?
- [ ] Fix the whole ownership thing