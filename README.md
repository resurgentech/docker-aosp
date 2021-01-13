# Android Open Source Project Docker Build Environment

Minimal Docker image capable of building AOSP and related Android system code.

## Install

Assuming Docker works properly just run the following to create a docker image that can be used to build aosp and even run adb jobs as necessary.
```
./scripts/make_docker_image.sh
```

## Usage
Here is an example Usage
```
docker run -it --rm \
  --env USER_ID=$(id -u) \
  --env GROUP_ID=$(id -g) \
  --volume /aosp:/aosp \
  --volume `pwd`:/workdir \
  resurgentech/aosp:latest \
  "\
    ls \
  "
```

Container expected to have /workdir and /aosp directories mapped to the host systems local filesystem.

### breakdown of example usage
```
docker run -it --rm
```
Starts a container '-it' interactive mode.  '--rm' cleans up the container on exit.

```
--env USER_ID=$(id -u) --env GROUP_ID=$(id -g)
```
Uses features of Docker image to use the same uid and gid as the user that starts the container.  The idea is to enable the files managed and created by the container to maintain the same user permissions.

```
--volume /aosp:/aosp  --volume `pwd`:/workdir
```
Maps host directory /aosp to container directory /aosp and maps the current working directory to /workdir

```
resurgentech/aosp:latest
```
Specified container image to start image from.

```
"\
  ls \
"
```
NOTE: This last part is quotes is optional.  A string after the image will be executed but if there is no commands after the image it will default to a bash shell


## Helper Scripts

### /scripts/example_run_bash.sh
> Runs a bash shell from the docker image for aosp

### /scripts/example_run_bash_as_root.sh
> Runs a bash shell from the docker image for aosp but as root rather than the local user

### ./script/push_images.sh
> Push the container images to docker hub

### ./build.sh
> Builds the container images for aosp

## /utils directory
### docker_entrypoint.sh, gitconfig, ssh_config
> Used as templates for making the docker image

# Notes
Based in large part from https://github.com/kylemanna/docker-aosp
