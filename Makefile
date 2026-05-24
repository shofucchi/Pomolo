PROJECT_NAME := Pomolo
XCODEPROJ := $(PROJECT_NAME).xcodeproj

.DEFAULT_GOAL := help

.PHONY: help bootstrap generate open

help:
	@echo "利用可能なコマンド一覧:"
	@echo "  make bootstrap  Mintfile に書かれたツールをインストールする"
	@echo "  make generate   project.yml から $(XCODEPROJ) を生成する"
	@echo "  make open       bootstrap と generate を実行し、Xcode が未起動なら開く"

bootstrap:
	mint bootstrap

generate:
	mint run xcodegen generate

open: bootstrap generate
	@if pgrep -x Xcode >/dev/null; then \
		echo "Xcode is already running. Skipping open."; \
	else \
		open $(XCODEPROJ); \
	fi
