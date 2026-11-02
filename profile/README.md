# GQYTeam

GQY 是跑在你自己电脑上的 AI 助手网关：把 OpenAI 兼容、Anthropic、Gemini 等多家的模型接入，统一成一套协议，既服务内部的 agent loop，也服务外部的 OpenAI 兼容客户端。工具之外的能力用插件运行时扩展：原生 JSON-RPC、MCP，以及远程 unix / tcp 插件。

## 仓库

| 仓库 | 内容 | 状态 |
| --- | --- | --- |
| [GQY](https://github.com/GQYTeam/GQY) | 主仓库：网关、agent loop、插件运行时、评测、零构建 Web UI | 活跃 |
| [gqy-plugins](https://github.com/GQYTeam/gqy-plugins) | 插件在线目录（`registry.json`）与 `gqy-plugin` CLI | 骨架 |
| [gqy-plugins-ShowImages-default](https://github.com/GQYTeam/gqy-plugins-ShowImages-default) | 插件示例：图片展示（13 张示例图，`list` / `show`） | 活跃 |
| [gqy-plugins-EmotePack-default](https://github.com/GQYTeam/gqy-plugins-EmotePack-default) | 插件示例：表情包（24 态表情 + 4 动图，`list` / `show` / `match`） | 活跃 |
| [gqy-plugins-Migrator-default](https://github.com/GQYTeam/gqy-plugins-Migrator-default) | 迁移器（一次性插件）：旧版 GQY v0.7.0 的 `GQY_HOME` → 新数据根，默认 dry-run、幂等、脱敏 | 活跃 |
| [.github](https://github.com/GQYTeam/.github) | 组织门面、组织级模板与仓库标准 | 标准 |

## 仓库标准

每个仓库必备：`LICENSE`、`NOTICE`、`README.md`、`CONTRIBUTING.md`、`SECURITY.md`、`CHANGELOG.md`、`.editorconfig`、`.gitignore`、`Makefile`、`.github/`（CI + Issue / PR 模板 + dependabot）。细则与模板见 [STANDARDS.md](https://github.com/GQYTeam/.github/blob/main/STANDARDS.md)。

## 许可与署名

本组织的代码与文档按 [PolyForm Noncommercial License 1.0.0](https://polyformproject.org/licenses/noncommercial/1.0.0) 授权：

**禁止商用。** 生产、部署、售卖、SaaS、内置于商业产品等任何商业目的的使用，都不在授权范围内。

**fork、二次开发、借鉴代码 / 文档 / 设计，都必须标注来源与原作者**，并保留各仓库的 `LICENSE` 与 `NOTICE`。署名格式：

```text
来源项目：GQYTeam/<仓库名>
项目地址：https://github.com/GQYTeam/<仓库名>
原作者：GQYTeam
许可证：PolyForm Noncommercial License 1.0.0
```

## 参与

一个改动一个分支一个 PR，CI 全绿 + 一次评审才能合入 `main`。提 issue / PR 前先看对应仓库的 `CONTRIBUTING.md`；安全漏洞按 `SECURITY.md` 走私密披露，不要开公开 issue。
