# Docker bug value too long

Trying to build multi arch image with buildx (cf `Makefile`) and get the following result

```
 > [linux/arm/v7 4/5] RUN cargo fetch:
#16 0.502     Updating crates.io index
#16 0.956 warning: spurious network error (2 tries remaining): could not read directory '/usr/local/cargo/registry/index/github.com-1285ae84e5963aae/.git//refs': Value too large for defined data type; class=Os (2)
#16 1.378 warning: spurious network error (1 tries remaining): could not read directory '/usr/local/cargo/registry/index/github.com-1285ae84e5963aae/.git//refs': Value too large for defined data type; class=Os (2)
#16 1.808 error: failed to get `actix-http` as a dependency of package `docker-bug-value-too-long v0.1.0 (/code)`
#16 1.808
#16 1.808 Caused by:
#16 1.809   failed to fetch `https://github.com/rust-lang/crates.io-index`
#16 1.809
#16 1.809 Caused by:
#16 1.809   could not read directory '/usr/local/cargo/registry/index/github.com-1285ae84e5963aae/.git//refs': Value too large for defined data type; class=Os (2)
------
failed to solve: rpc error: code = Unknown desc = executor failed running [/bin/sh -c cargo fetch]: buildkit-runc did not terminate successfully
make: *** [Makefile:5: build] Error 1
```

## Reproduce

```
git clone ...
make context
make build
```

## Versions

### Docker version

```
docker version
Client:
 Version:           19.03.12-ce
 API version:       1.40
 Go version:        go1.14.5
 Git commit:        48a66213fe
 Built:             Sat Jul 18 01:33:21 2020
 OS/Arch:           linux/amd64
 Experimental:      true

Server:
 Engine:
  Version:          19.03.12-ce
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.14.5
  Git commit:       48a66213fe
  Built:            Sat Jul 18 01:32:59 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v1.4.0.m
  GitCommit:        09814d48d50816305a8e6c1a4ae3e2bcc4ba725a.m
 runc:
  Version:          1.0.0-rc92
  GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

### Docker buildx version

```
github.com/docker/buildx v0.4.2 fb7b670b764764dc4716df3eba07ffdae4cc47b2
```
