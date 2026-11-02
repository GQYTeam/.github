# GQYTeam/.github

组织级仓库。它管三件事：

1. **组织门面**：`profile/README.md` 渲染在 <https://github.com/GQYTeam> 首页。
2. **组织级默认社区健康文件**：仓库缺 `CONTRIBUTING.md` / `SECURITY.md` / `CODE_OF_CONDUCT.md` / Issue 模板时，GitHub 会回退到本仓库的同名文件。
3. **仓库标准与模板**：`STANDARDS.md` 是唯一标准源，`standards/templates/` 是新仓库要复制的模板。

## 目录

| 路径 | 作用 |
| --- | --- |
| `profile/README.md` | 组织页 README |
| `STANDARDS.md` | 仓库标准 v1：必备文件、许可、分支、提交、CI 基线 |
| `standards/LICENSE-body.txt` | PolyForm Noncommercial License 1.0.0 官方全文，不改写 |
| `standards/templates/` | LICENSE 头、NOTICE、CONTRIBUTING、SECURITY、CHANGELOG、Issue / PR 模板、CI 骨架 |
| `CONTRIBUTING.md` | 组织级默认贡献指南 |
| `SECURITY.md` | 组织级默认漏洞披露流程 |
| `CODE_OF_CONDUCT.md` | 组织级默认行为准则 |
| `ISSUE_TEMPLATE/`、`pull_request_template.md` | 组织级默认模板 |
| `scripts/check-org.sh` | 组织一致性检查：必备文件齐全 + 组织页链接可达 |
| `Makefile` | `make check` |

## 新仓库怎么用

```bash
# 1. 建仓并初始化
gh repo create GQYTeam/gqy-<主题> --public
git init -b main && git remote add origin https://github.com/GQYTeam/gqy-<主题>.git

# 2. 复制标准文件（<REPO> 换成仓库名）
REPO=gqy-<主题>
sed "s/<REPO>/$REPO/g" standards/templates/LICENSE.head > LICENSE
cat standards/LICENSE-body.txt >> LICENSE
sed "s/<REPO>/$REPO/g" standards/templates/NOTICE > NOTICE
cp standards/templates/CONTRIBUTING.md standards/templates/SECURITY.md standards/templates/CHANGELOG.md .
cp standards/templates/editorconfig .editorconfig
cp -R standards/templates/ISSUE_TEMPLATE .github/
cp standards/templates/pull_request_template.md .github/

# 3. 按 STANDARDS.md 自检
make check
```

## 改标准

标准变更走 PR：同一个 PR 里先改 `STANDARDS.md`，再改 `standards/templates/`，最后更新 `profile/README.md` 里受影响的描述。改完在 PR 描述里列出需要跟进的下游仓库。

## 许可

PolyForm Noncommercial License 1.0.0，禁止商用；fork / 二改 / 借鉴必须署名并保留 `LICENSE` 与 `NOTICE`。
