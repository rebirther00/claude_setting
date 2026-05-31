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

## 포함된 플러그인 (settings.json 기준, 8개)

| 플러그인 | 마켓플레이스(출처) | 한줄 |
|---|---|---|
| `bkit` | popup-studio-ai/bkit-claude-code | PDCA 종합 개발 킷 |
| `bkit-starter` | (동일) | 초보자 온보딩 |
| `context7` | claude-plugins-official | 최신 라이브러리 문서 MCP |
| `andrej-karpathy-skills` | forrestchang/andrej-karpathy-skills | 코딩 실수 방지 가이드 |
| `watch` | bradautomates/claude-video | 영상 시청·요약 |
| `frontend-design` | claude-plugins-official | 고품질 프론트엔드 UI |
| `superpowers` | claude-plugins-official | TDD·디버깅·플래닝 14종 |
| `understand-anything` | Lum1104/Understand-Anything | 코드베이스 이해·시각화 |

> 📖 각 스킬이 무엇이고 어떻게 쓰는지는 [SKILLS.md](./SKILLS.md) 참고.

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
