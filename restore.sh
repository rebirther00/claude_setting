#!/usr/bin/env bash
# Claude Code 전역 설정 복원 (macOS / Linux)
# 사용법:
#   git clone <repo-url> claude-dotfiles
#   cd claude-dotfiles
#   ./restore.sh
set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
SRC="$(cd "$(dirname "$0")" && pwd)/settings.json"
DST="$CLAUDE_DIR/settings.json"

mkdir -p "$CLAUDE_DIR"

if [ -f "$DST" ]; then
  cp "$DST" "$DST.bak"
  echo "기존 settings.json 백업: $DST.bak"
fi

cp "$SRC" "$DST"
echo "settings.json 복원 완료 -> $DST"
echo
echo "이제 claude 를 실행하면 enabledPlugins/extraKnownMarketplaces 기준으로 플러그인이 자동 설치됩니다."
echo "자동 설치가 안 되면 claude 안에서 수동 실행:"
echo "  /plugin marketplace add popup-studio-ai/bkit-claude-code"
echo "  /plugin marketplace add forrestchang/andrej-karpathy-skills"
echo "  /plugin install bkit@bkit-marketplace"
echo "  /plugin install bkit-starter@bkit-marketplace"
echo "  /plugin install andrej-karpathy-skills@karpathy-skills"
