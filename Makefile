VERSIONS ?=	$(wildcard 1*.*)
PROXYFIED_COMMANDS ?=	\
	all \
	build \
	check_s3 \
	clean \
	image_on_store \
	image_on_s3 \
	image_on_local \
	info \
	install \
	install_on_disk \
	publish_on_s3 \
	publish_on_store \
	publish_on_s3.sqsh \
	publish_on_s3.tar \
	publish_on_s3.tar.gz \
	re \
	rebuild \
	release \
	run \
	shell \
	sync-image-tools \
	travis

all:
	build

# Proxyfied Makefile commands
.PHONY: $(PROXYFIED_COMMANDS)
$(PROXYFIED_COMMANDS):
	for version in $(VERSIONS); do \
	    $(MAKE) -C $$version $@; \
	done


docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
