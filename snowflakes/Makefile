# import config.
# You can change the default config with `make dockerfile="Dockerfile.Debian11" all`
DOCKER_REBUILD ?= false
DOCKER_BUILD := docker build --progress=plain
DOCKER_COMPOSE_FILE ?= docker-compose.yml

ifeq "$(DOCKER_REBUILD)" "true"
	DOCKER_BUILD += --no-cache --pull
endif

.DEFAULT_GOAL := centos9

centos7: dockerfile=Dockerfile.CentOS7
centos7: all

centos8: dockerfile=Dockerfile.CentOS8
centos8: all

centos9: dockerfile=Dockerfile.CentOS9 
centos9: all

rhel7: dockerfile=Dockerfile.RedHat7
rhel7: all

rhel8: dockerfile=Dockerfile.RedHat8
rhel8: all

rhel9: dockerfile=Dockerfile.RedHat9 
rhel9: all

debian11: dockerfile=Dockerfile.Debian11
debian11: all

all: build_snowflake_image run_snowflakes

build_snowflake_image: stop_snowflakes
	${DOCKER_BUILD} --file ./$(dockerfile) -t snowflakes_baseimage .

stop_snowflakes:
	docker-compose down

run_snowflakes:
	docker-compose -f ${DOCKER_COMPOSE_FILE} up -d
