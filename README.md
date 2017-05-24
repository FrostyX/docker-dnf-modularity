A docker image with `dnf module ...` support

This docker installs an unreleased DNF version from <https://copr.fedorainfracloud.org/coprs/mhatina/DNF-Modules/>

## Usage

	docker build -t dnf-modularity .
	docker run -it dnf-modularity /bin/bash

## DNF with modularity support

	# Enable module
	dnf module enable base-runtime-f26
	dnf module list --enabled

	# Install module
	dnf module install base-runtime/baseimage

    # Possibility to install modules and packages with a same command
	# @FIXME this behaves differently than the `module install`
	# command above, which is imho wrong. Reported:
	# https://docs.google.com/document/d/1QXkXdDrAo_IkJYOOFNNkh-XV0ZCZA56Fjfe7Ah7qxt0/edit?disco=AAAABEHotVc
	dnf install @base-runtime/baseimage

## Mock experiments

Requires `master` mock from <https://github.com/rpm-software-management/mock>
