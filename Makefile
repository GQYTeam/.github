SHELL := /bin/sh

.PHONY: help check

help:
	@printf '%s\n' \
	  'make check   组织一致性检查：必备文件齐全 + 组织页链接可达'

check:
	./scripts/check-org.sh
