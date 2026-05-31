# 설치된 스킬(플러그인) 안내

이 PC의 Claude Code 전역(user scope)에 설치된 플러그인과, 각 플러그인이 제공하는 스킬의 용도·사용법 정리.
스킬은 보통 **`/스킬이름`** 으로 직접 호출하거나, 관련 키워드를 자연어로 말하면 **자동 발동**됩니다.

> 출처(마켓플레이스)는 `settings.json`의 `extraKnownMarketplaces`에, 활성화 여부는 `enabledPlugins`에 기록됨.

---

## 1. bkit  (`bkit-marketplace`, v1.6.1)

AI-Native 개발 방법론 **PDCA**(Plan-Do-Check-Act) 중심의 종합 개발 킷. 한국어 트리거 지원.

| 스킬 | 용도 | 사용 예 |
|---|---|---|
| `/pdca` | 계획·설계·구현·분석·보고 통합 관리 | `/pdca plan 로그인기능`, `/pdca status` |
| `/plan-plus` | 브레인스토밍 강화 기획 | `/plan-plus 결제 모듈` |
| `/starter` `/dynamic` `/enterprise` | 레벨별 개발(정적웹 / 풀스택 / MSA) | `init dynamic` |
| `/development-pipeline`, `/phase-1`~`/phase-9` | 9단계 개발 파이프라인 | "뭐부터 시작하지?" |
| `/bkend-*` | bkend.ai BaaS (auth/data/storage/quickstart/cookbook) | "로그인 붙여줘" |
| `/code-review` `/zero-script-qa` | 코드 리뷰 / 로그 기반 QA | `/code-review` |

**언제**: 새 기능을 체계적인 문서(계획→설계→검증→보고)로 개발할 때. 한글 "계획/설계/분석/검증/보고"로도 자동 발동.

## 2. bkit-starter  (`bkit-marketplace`, v1.0.0)

완전 초보자용 온보딩 가이드.

| 스킬 | 용도 |
|---|---|
| `/first-claude-code` | 첫 프로젝트 단계별 쇼케이스 |
| `/learn-claude-code` | Claude Code 학습 커리큘럼 |
| `/setup-claude-code` | 기존 프로젝트에 설정 자동 생성 |
| `/upgrade-claude-code` | 설정 최신 트렌드로 업그레이드 |

**언제**: Claude Code 자체를 배우거나 프로젝트 초기 세팅이 필요할 때.

## 3. context7  (`claude-plugins-official`)

> ⚠️ 이건 스킬이 아니라 **MCP 서버**입니다.

라이브러리/프레임워크의 **최신 공식 문서**를 실시간으로 가져와 코드 작성에 반영. 별도 호출 없이, 라이브러리 사용법을 물으면 최신 문서를 참조해 답함. "use context7" 같이 명시도 가능.

**언제**: 버전이 자주 바뀌는 라이브러리(Next.js, React 등) 정확한 최신 API가 필요할 때.

## 4. andrej-karpathy-skills  (`karpathy-skills`, v1.0.0)

| 스킬 | 용도 |
|---|---|
| `karpathy-guidelines` | LLM 코딩 실수 줄이는 행동 가이드(과설계 방지, 최소 변경, 가정 명시, 검증 기준 정의) |

**언제**: 코드 작성/리뷰/리팩터링 시 자동 적용되어 군더더기 없는 수술적 변경을 유도.

## 5. watch  (`claude-video`, v0.1.3)

| 스킬 | 용도 | 사용 예 |
|---|---|---|
| `watch` | 영상(URL/로컬)을 Claude가 "시청". yt-dlp로 다운로드 → ffmpeg로 프레임 추출 → 자막/Whisper로 대본 확보 후 질의응답 | "이 유튜브 영상 요약해줘 <URL>" |

**필요 도구**: `yt-dlp`, `ffmpeg` (없으면 설치 필요). YouTube/Vimeo/TikTok 등 지원.
**언제**: 영상 내용을 보고 요약·질문·정리해야 할 때.

## 6. frontend-design  (`claude-plugins-official`)

| 스킬 | 용도 |
|---|---|
| `frontend-design` | 흔한 "AI st 디자인"을 피한, 완성도 높은 프론트엔드 UI/UX 생성 |

**언제**: 웹 컴포넌트/페이지/앱을 만들 때 자동 발동. 디자인 퀄리티가 중요한 화면 작업에 유용.

## 7. superpowers  (`claude-plugins-official`, v5.1.0)

Claude Code 핵심 스킬 라이브러리 — TDD·디버깅·협업·플래닝 등 검증된 워크플로우 14종.

| 스킬 | 언제 사용 |
|---|---|
| `brainstorming` | **모든 창작/기능 작업 전** 의도·요구사항 탐색 (필수 선행) |
| `writing-plans` / `executing-plans` | 다단계 작업 계획 수립 / 체크포인트 실행 |
| `test-driven-development` | 구현 전 테스트부터 (TDD) |
| `systematic-debugging` | 버그·테스트 실패 시 추측 금지, 체계적 원인 분석 |
| `verification-before-completion` | "완료" 주장 전 검증 명령 실행 + 증거 확인 |
| `requesting/receiving-code-review` | 코드 리뷰 요청 / 피드백 수용(맹목 동의 금지) |
| `dispatching-parallel-agents`, `subagent-driven-development` | 독립 작업 병렬 처리 |
| `using-git-worktrees` | 격리된 작업 공간 확보 |
| `finishing-a-development-branch` | 작업 완료 후 merge/PR/정리 |
| `writing-skills` | 새 스킬 제작·편집·검증 |
| `using-superpowers` | 대화 시작 시 스킬 사용법 확립 |

**언제**: 진지한 개발 워크플로우(계획→TDD→디버깅→검증→리뷰→마무리)를 규율 있게 돌릴 때. 대부분 자연어 맥락으로 자동 발동.

## 8. understand-anything  (`understand-anything`, v2.7.5)

코드베이스를 분석·시각화·설명하는 온보딩/이해 도구.

| 스킬 | 용도 |
|---|---|
| `/understand` | 코드베이스 → 인터랙티브 지식 그래프 생성 |
| `/understand-chat` | 지식 그래프 기반으로 코드에 질문 |
| `/understand-dashboard` | 지식 그래프 웹 대시보드 실행 |
| `/understand-diff` | git diff/PR 변경점·영향·리스크 분석 |
| `/understand-domain` | 비즈니스 도메인 지식·흐름 그래프 추출 |
| `/understand-explain` | 특정 파일/함수/모듈 심층 설명 |
| `/understand-onboard` | 신규 팀원용 온보딩 가이드 생성 |
| `/understand-knowledge` | Karpathy식 LLM wiki 지식베이스 분석 |

**언제**: 처음 보는/큰 코드베이스를 빠르게 파악하거나, 신규 인원 온보딩 자료가 필요할 때.

---

## 사용 팁

- **직접 호출**: 채팅창에 `/스킬이름` 입력 (자동완성 지원).
- **자동 발동**: 위 "언제"에 해당하는 작업을 자연어로 요청하면 Claude가 알아서 관련 스킬을 띄움.
- **목록 확인**: 새 PC에서 설치 후 `claude` 재시작 → 스킬 자동완성 또는 `/help`에서 확인.
- **MCP(context7)는 슬래시 명령이 아님** — 라이브러리 문서가 필요한 맥락에서 백그라운드로 동작.
