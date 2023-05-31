# import config.
# You can change the default config with `make dockerfile="Dockerfile.Debian11" all`
DOCKER_REBUILD ?= false
DOCKER_BUILD := docker build --progress=plain
 
ifeq "$(DOCKER_REBUILD)" "true"
	DOCKER_BUILD += --no-cache --pull
endif

.DEFAULT_GOAL := all

all: build_phoenixserver_image post_build

.PHONY: build_phoenixserver_image
build_phoenixserver_image: 
	$(DOCKER_BUILD) -t phoenixserver .

.PHONY: post_build
post_build:
	@printf 'alias phoenixproject="docker run -ti --rm -v \044(pwd)/apb:/apb --network=snowflakes_snowflakes phoenixserver\"\n'
