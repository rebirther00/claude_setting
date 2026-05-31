# claude-dotfiles

Claude Code **전역(user scope) 설정**을 Git으로 관리하는 저장소.
여러 PC에서 동일한 플러그인/스킬 구성을 빠르게 재현하기 위함.

> ⚠️ Claude Code는 `~/.claude/` 설정을 계정으로 클라우드 동기화하지 **않습니다.**
> 그래서 새 PC마다 수동 재현이 필요하고, 이 저장소가 그 역할을 합니다.

## 관리 대상

| 파일 | 내용 | 커밋 |
|---|---|---|
| `settings.json` | 전역 설정 + 플러그인/마켓플레이스 목록 | ✅ |
| `settings.local.json` | 이 PC 전용 권한 경로 (비밀X, 기계 종속) | ❌ 제외 |
| `plugins/cache`, `projects/` 등 | 재설치 가능 / 세션 기록(민감) | ❌ 제외 |

## 포함된 플러그인 (settings.json 기준)

- `bkit@bkit-marketplace` — popup-studio-ai/bkit-claude-code
- `bkit-starter@bkit-marketplace` — 동일 마켓플레이스
- `context7@claude-plugins-official` — anthropics 공식
- `andrej-karpathy-skills@karpathy-skills` — forrestchang/andrej-karpathy-skills

## 새 PC에서 복원

```bash
git clone <이-저장소-URL> claude-dotfiles
cd claude-dotfiles
# Windows
./restore.ps1
# macOS / Linux
./restore.sh
```

이후 `claude` 실행 → settings.json 기준으로 플러그인 자동 설치.
(자동 설치 안 되면 restore 스크립트가 안내하는 `/plugin ...` 명령을 수동 실행)

## 설정을 바꾼 뒤 (이 PC → 저장소 반영)

```bash
cp "$HOME/.claude/settings.json" ./settings.json   # Windows: copy %USERPROFILE%\.claude\settings.json settings.json
git add settings.json
git commit -m "update: settings"
git push
```
