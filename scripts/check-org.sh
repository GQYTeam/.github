#!/usr/bin/env bash
# 组织一致性检查：必备文件齐全 + 组织页链接可达。
# 只读，不改任何文件；在 CI 与本地都能跑。
set -uo pipefail

ORG=GQYTeam
REPOS=(GQY gqy-plugins gqy-plugins-ShowImages-default gqy-plugins-EmotePack-default gqy-plugins-Migrator-default .github)

fail=0
say() { printf '%s\n' "$*"; }

# 1. 本仓库必备文件
for f in LICENSE NOTICE README.md STANDARDS.md CONTRIBUTING.md SECURITY.md CODE_OF_CONDUCT.md \
         profile/README.md pull_request_template.md .editorconfig; do
  if [ ! -f "$f" ]; then
    say "缺少文件: $f"
    fail=1
  fi
done

# 2. LICENSE 必须带 Required Notice
if ! grep -q '^Required Notice: Copyright (c) 2026 GQYTeam' LICENSE 2>/dev/null; then
  say "LICENSE 缺少 Required Notice 行"
  fail=1
fi

# 3. 组织页列出的仓库必须可达
for r in "${REPOS[@]}"; do
  code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "https://github.com/$ORG/$r")
  if [ "$code" != "200" ]; then
    say "仓库不可达: $ORG/$r (HTTP $code)"
    fail=1
  fi
done

# 4. 组织页里引用的 GQYTeam 链接必须可达
urls=$(grep -oE "https://github\.com/$ORG/[A-Za-z0-9._-]+" profile/README.md | sort -u)
for url in $urls; do
  code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "$url")
  if [ "$code" != "200" ]; then
    say "组织页链接失效: $url (HTTP $code)"
    fail=1
  fi
done

if [ "$fail" -eq 0 ]; then
  say "组织检查通过：必备文件齐全，链接全部可达。"
fi
exit "$fail"
