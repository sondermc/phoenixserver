PROJECT_ROOT ?= $(PWD)
generate_keypair := false
MAKE ?= $(shell which make)
SSH_KEYGEN ?= $(shell which ssh-keygen)
CP ?= $(shell which cp)
RM ?= $(shell which rm)

.DEFAULT_GOAL := centos9

.PHONY: all
all:
ifneq ($(wildcard (${PROJECT_ROOT}/phoenixserver/alpine/phoenix_keypair-rsa)),)
all: generate_keypair snowflakes phoenixserver
else ifneq ($(wildcard (${PROJECT_ROOT}/phoenixserver/alpine/phoenix_keypair-rsa.pub)),)
all: generate_keypair snowflakes phoenixserver
else ifneq ($(wildcard (${PROJECT_ROOT}/snowflakes/config/phoenix_keypair-rsa.pub)),)
all: generate_keypair snowflakes phoenixserver
else
all: snowflakes phoenixserver
endif

.PHONY: generate_keypair
generate_keypair:
	$(RM) -f ${PROJECT_ROOT}/phoenixserver/alpine/phoenix_keypair-rsa \
	  ${PROJECT_ROOT}/phoenixserver/alpine/phoenix_keypair-rsa.pub \
	  ${PROJECT_ROOT}/snowflakes/config/phoenix_keypair-rsa.pub
	$(SSH_KEYGEN) -f ${PROJECT_ROOT}/phoenixserver/alpine/phoenix_keypair-rsa -t rsa -b 4096 -P ''
	$(CP) ${PROJECT_ROOT}/phoenixserver/alpine/phoenix_keypair-rsa.pub ${PROJECT_ROOT}/snowflakes/config/

.PHONY: snowflakes
snowflakes:
	${MAKE} --directory ${PROJECT_ROOT}/snowflakes/ $(build_target)

.PHONY: phoenixserver
phoenixserver:
	${MAKE} --directory ${PROJECT_ROOT}/phoenixserver/ all

centos7: build_target = centos7
centos7: all

centos8: build_target = centos8
centos8: all

centos9: build_target = centos9
centos9: all

rhel7: build_target = rhel7
rhel7: all

rhel8: build_target = rhel8
rhel8: all

rhel9: build_target = rhel9
rhel9: all

debian11: build_target = debian11
debian11: all
