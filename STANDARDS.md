# GQYTeam 仓库标准 v1

适用范围：`https://github.com/GQYTeam` 下所有仓库。新增仓库先按本文件补齐，再提 PR 合并。
标准源就在本仓库（`GQYTeam/.github`）：本文件定规矩，`standards/` 放模板与许可全文，`profile/README.md` 是对外门面。

## 1. 必备文件

每个仓库根目录必须有下面这些文件；缺一项即视为「未完成标准」。

| 文件 | 作用 | 来源 |
| --- | --- | --- |
| `LICENSE` | PolyForm Noncommercial 1.0.0 + Required Notice | 按 §2 生成 |
| `NOTICE` | 来源与署名要求（四项署名格式） | `templates/NOTICE`，替换 `<REPO>` |
| `README.md` | 仓库入口：它是什么、怎么跑、怎么验、许可与署名 | 各仓库自己写 |
| `CONTRIBUTING.md` | 分支 / PR / 提交 / 验收 / 许可证条款 | `templates/CONTRIBUTING.md` |
| `SECURITY.md` | 私密漏洞披露流程 | `templates/SECURITY.md` |
| `CHANGELOG.md` | Keep a Changelog 风格变更记录 | `templates/CHANGELOG.md` |
| `.editorconfig` | 编辑器约定 | `templates/editorconfig` |
| `.gitignore` | 语言相关忽略规则（必须含 `.DS_Store`） | 各仓库自己写 |
| `Makefile` | 一条命令跑完检查（`make check`） | 各仓库自己写 |
| `.github/workflows/ci.yml` | 格式化 + 静态检查 + 测试 | 各仓库按语言写 |
| `.github/ISSUE_TEMPLATE/{bug_report,feature_request,config}.yml` | Issue 模板 | `templates/ISSUE_TEMPLATE/` |
| `.github/pull_request_template.md` | PR 模板 | `templates/pull_request_template.md` |
| `.github/dependabot.yml` | 依赖更新（`github-actions` 必配） | `templates/dependabot.yml` + 语言生态 |

**`.github` 仓库的特殊约定**：它本身就是组织级默认文件的来源，所以 GitHub 要求的社区健康文件放**仓库根目录**（`CONTRIBUTING.md`、`SECURITY.md`、`CODE_OF_CONDUCT.md`、`ISSUE_TEMPLATE/`、`pull_request_template.md`），不再套一层 `.github/`；其余必备文件（`LICENSE`、`NOTICE`、`README.md`、`CHANGELOG.md`、`.editorconfig`、`.gitignore`、`Makefile`、`.github/workflows/ci.yml`、`.github/dependabot.yml`）照常。

## 2. LICENSE 生成方式

```bash
REPO=<仓库名>
sed "s/<REPO>/$REPO/g" standards/templates/LICENSE.head > "$REPO/LICENSE"
cat standards/LICENSE-body.txt >> "$REPO/LICENSE"
```

`LICENSE-body.txt` 是 PolyForm Noncommercial License 1.0.0 官方全文，**不要改写**。
`LICENSE.head` 顶部的 `Required Notice:` 行是署名条款的法律抓手（见 PolyForm 的 Notices 一节），必须原样保留。

## 3. 许可与署名（不许改口径）

- 许可：**PolyForm Noncommercial License 1.0.0**。
- 禁止商用；fork、二次开发、借鉴代码 / 文档 / 设计，都必须标注来源与原作者，并保留 `LICENSE` 与 `NOTICE`。
- README 里必须有「许可与署名」小节，写清：禁止商用 + 四项署名格式 + 指向 `NOTICE`。
- `docs/` 里引用的第三方代码 / 素材 / 参考项目，许可与出处记在 `docs/third-party/`，不放 COPYING 之类多余文件。

## 4. 命名与分支

- 默认分支 `main`；仓库名小写中划线：`gqy-<主题>`，插件仓库 `gqy-plugins-<Name>-default`。
- 分支：`feat/<主题>`、`fix/<主题>`、`docs/<主题>`、`chore/<主题>`。
- 一个改动一个分支一个 PR；合入 `main` 前 CI 全绿 + 一次评审。
- tag `vX.Y.Z` 对应一份可复现产物与 `CHANGELOG.md` 条目。

## 5. 提交信息

- 主题行祈使句、≤72 字符，可用 `feat:` / `fix:` / `docs:` / `chore:` / `test:` 前缀。
- 正文写动机与影响面；关联 issue 用 `Closes #123`。
- 不提交构建产物、二进制、`.DS_Store`、密钥、`.env`、用户数据。

## 6. CI 基线

不许 mock / 冒烟资产；验证走生产代码路径的单元 / 集成测试。

| 仓库类型 | `make check` 应包含 | CI `ci.yml` |
| --- | --- | --- |
| Go 服务（GQY） | `gofmt -l` 无输出、`go vet ./...`、`go test ./...`、`go build` | 已有 `GQY/.github/workflows/ci.yml`（含 race 与覆盖率） |
| Go 工具（gqy-plugins） | 同上 | Go 版本矩阵 + `gofmt -l` 检查 |
| Node 插件（零依赖） | `node --check` 全部 `.js`/`.mjs`、`npm test` | Node 20 + `node --check` + `npm test`（无依赖则不 `npm ci`） |

## 7. 仓库清单与状态

| 仓库 | 类型 | 远程 | 默认分支 | 状态 |
| --- | --- | --- | --- | --- |
| `GQY` | Go 网关 + 零构建前端 | <https://github.com/GQYTeam/GQY> | `main` | 活跃，CI 绿 |
| `gqy-plugins` | Go：插件在线目录 + CLI | <https://github.com/GQYTeam/gqy-plugins> | `main` | 骨架（registry 已实现），CI 绿 |
| `gqy-plugins-ShowImages-default` | Node 插件：图片展示 | <https://github.com/GQYTeam/gqy-plugins-ShowImages-default> | `main` | 活跃，CI 绿 |
| `gqy-plugins-EmotePack-default` | Node 插件：表情包 | <https://github.com/GQYTeam/gqy-plugins-EmotePack-default> | `main` | 活跃，CI 绿 |
| `.github` | 组织门面、标准源与组织级模板 | <https://github.com/GQYTeam/.github> | `main` | 标准源，CI 绿 |
| `gqy-plugins-GitHubAccount-default` | Node 插件：GitHub 账号（设备码远程授权 + 隔离 gh） | 未建库 | — | 规划中，未开工 |

以上五个已建仓库的 `main` 均已开启分支保护：禁止强推与删除，PR 需 1 次评审，必须通过对应 CI 检查（admin 可应急放行）。

## 8. 验收命令

```bash
# 每个仓库
make check          # 或该仓库 README 写明的等价命令
git status --short  # 必须干净
git log --oneline -1
git remote -v       # origin 指向 github.com/GQYTeam/<repo>

# 远程侧
gh repo view GQYTeam/<repo> --json name,visibility,defaultBranchRef
gh run list --repo GQYTeam/<repo> --limit 3
```
