# 变更记录

格式参照 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

## [1.0.0] - 2026-11-02

### Added

- `profile/README.md`：组织首页（仓库地图、仓库标准、许可与署名、参与方式）。
- `STANDARDS.md`：仓库标准 v1 —— 必备文件、LICENSE 生成方式、许可与署名口径、命名与分支、提交信息、CI 基线、仓库清单与状态。
- `standards/`：`LICENSE-body.txt`（PolyForm Noncommercial License 1.0.0 官方全文）与 `templates/`（LICENSE 头、NOTICE、CONTRIBUTING、SECURITY、CHANGELOG、Issue / PR 模板、CI 骨架、dependabot）。
- 组织级默认社区健康文件：`CONTRIBUTING.md`、`SECURITY.md`、`CODE_OF_CONDUCT.md`、`ISSUE_TEMPLATE/`、`pull_request_template.md`。
- `scripts/check-org.sh` + `Makefile` + `.github/workflows/ci.yml`：必备文件齐全性与组织页链接可达性的机器校验。

### Changed

- 五个已建仓库（GQY、gqy-plugins、gqy-plugins-ShowImages-default、gqy-plugins-EmotePack-default、.github）统一到本标准的许可与文件基线。
