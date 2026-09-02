---
title: fie/text — Localization Scaffold
updated: 2026-07-11
---

# `fie/text` — RU / UK / EN scaffold

This folder holds the story text of **Friendship is Eternity** in three languages,
organized so the Russian original and the Ukrainian re-translation can be aligned
during the migration. See [`../reference/bible/`](../reference/bible/README.md) for the full analysis.

## Layout

| Folder | Contents | Granularity | Naming |
|---|---|---|---|
| `ru/` | The Russian **original** (source of truth for the plot). `.docx` originals in `source/` and their PDF renders in `render/`; extracted markdown split under `Фрагмент 1 - Огонь/` (per **subsection**) and `Побочные истории/` (side works). | Part / subsection | Russian |
| `uk/` | The Ukrainian **re-translation** (current published canon). One `.md` per **chapter (Розділ)** next to its rendered `.pdf`; part-level renders in `К1 …/render/`. Text extracted from the PDF renders — **the Google Doc is canonical**; verify before relying on the `.md`. | Chapter | Ukrainian |
| `en/` | English mirror of the UK tree. Mostly `status: todo` stubs; `Ch 0 - Legend of the Princess` is pre-filled from the bilingual note. | Chapter | English |

## Structure mapping (RU → UK)

The RU hierarchy `Fragment → Часть → subsection` was promoted to
`Fragment → Книга → Частина → Розділ` (a RU **Часть** became a UK **Книга**, because
one Часть was too long for a single book). New **Розділ** (chapter) breaks were added.

| RU `Часть 1 След упавшей Звезды` | UK `Книга 1 Слід павшої Зірки` |
|---|---|
| *(standalone legend)* | **Ч1 / Р0 «Легенда про Принцесу»** — NEW overture |
| Пролог | Ч1 / Р1 «Забутий сон» |
| 1. Исчезающий Звездопад | Ч1 «Зникаючий Зорепад» (Р2–Р8) |
| 2. В тени Кантерлота | Ч2 «В тіні Кантерлота» |
| 3. Крыло Ночи | Ч3 «Крило Ночі» |
| 4. Мир Людей | Ч4 «Світ Людей» |
| 5. Немыслимое | Ч5 «Перший Гріх» *(renamed)* |
| 6. Проклятая Миром | **not yet translated** |
| 7. Фолленстар | **not yet translated** |

## Translation status

- **UK:** Book 0 (Appendices) + **Book 1 complete** (= RU Часть 1, subsections 1–5).
- **RU-only (untranslated):** Часть 1 subsections 6–7; the whole **Rebellion** (Часть 2–3);
  the finale (Часть 4, a stub). The RU manuscript itself **ends unfinished** mid-chapter
  in «Сердце Звезды».
- **EN:** not started (except the Legend of the Princess).

## Regenerating

The markdown was generated from the `.docx` (RU, via python-docx-free zip parse) and the
`.pdf` renders (UK, via `pdfminer.six`, reflowed). Originals are untouched. The generator
scripts live in the session scratchpad; ask to re-run if sources change.
