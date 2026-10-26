#!/bin/bash
# Run every Chapter 5 prompt on the sample inputs with Claude Code, headless.
#
#   bash chapter-prompts/ch05-initiation-and-planning/run.sh          all five use cases
#   bash chapter-prompts/ch05-initiation-and-planning/run.sh 3        one use case (1-5)
#   bash chapter-prompts/ch05-initiation-and-planning/run.sh 4b       stage 2 of use case 4 only, on existing stage 1 results
#   bash chapter-prompts/ch05-initiation-and-planning/run.sh 4c       stage 3 of use case 4 only (milestones), on existing results
#
# Writes <name>.new.md next to each saved output, so the saved outputs stay as they are.
# Use case 5 reads the outputs of 1-4 from the same run.
#
#   MODEL=opus bash .../run.sh     choose the model (default: sonnet)
#   OUT=saved  bash .../run.sh     overwrite the saved outputs (maintainers)
#
# Each prompt file's first ``` code block is the prompt; the inputs are pasted underneath
# it under their file names, exactly as you would paste them into a chat tool. Tools are
# switched off, so the model sees only what is pasted.

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODEL="${MODEL:-sonnet}"
OUT="${OUT:-new}"
ONLY="${1:-all}"

command -v claude >/dev/null || { echo "Claude Code (claude) is not on PATH." >&2; exit 1; }

# Run from an empty folder so the model sees only what is pasted, not this repository.
cd "$(mktemp -d)"

# output file for a given base path, e.g. out 1-charter/output -> 1-charter/output.new.md
out() { if [ "$OUT" = "saved" ]; then echo "$HERE/$1.md"; else echo "$HERE/$1.new.md"; fi; }

# the first fenced code block of a prompt file
prompt_of() { awk '/^```/{n++; next} n==1' "$1"; }

# paste files underneath a prompt, each under its own heading
with_inputs() {
    local text="$1"; shift
    for f in "$@"; do
        text+=$'\n\n---\n'"## File: $(basename "$f")"$'\n\n'"$(cat "$f")"
    done
    printf '%s' "$text"
}

# run one prompt and save the answer with a provenance header
run() {
    local prompt_file="$1" dest="$2" text="$3"
    echo "  → $(basename "$prompt_file") → ${dest#$HERE/}"
    mkdir -p "$(dirname "$dest")"
    {
        echo "> **Recorded output.** Produced by \`run.sh\` from \`${prompt_file#$HERE/}\` with model \`$MODEL\` on $(date +%Y-%m-%d)."
        echo "> One real run: yours will differ in wording. Validate it the way the prompt file describes."
        echo
        printf '%s' "$text" | claude -p --model "$MODEL" --tools ""
    } > "$dest"
}

step() { [ "$ONLY" = "all" ] || [ "$ONLY" = "$1" ]; }

if step 1; then
    echo "1 · Charter from mandate"
    p="$HERE/1-charter/prompt.md"
    text="$(prompt_of "$p")"$'\n\n'"(This is a recorded run, so you cannot pause. List your three sharpest questions first under the heading \"Questions I would ask first\", then draft both artifacts without waiting for answers.)"
    run "$p" "$(out 1-charter/output)" "$(with_inputs "$text" "$HERE"/1-charter/inputs/*.md)"
fi

if step 2; then
    echo "2 · Alignment gap detector"
    p="$HERE/2-alignment/prompt.md"
    run "$p" "$(out 2-alignment/output)" "$(with_inputs "$(prompt_of "$p")" "$HERE"/2-alignment/inputs/*.md)"
fi

if step 3; then
    echo "3 · Assumption extractor"
    p="$HERE/3-assumptions/prompt.md"
    run "$p" "$(out 3-assumptions/output)" "$(with_inputs "$(prompt_of "$p")" "$HERE/3-assumptions/inputs/scope-document.md")"
    echo "  quote gate:"
    python "$HERE/3-assumptions/check-quotes.py" "$(out 3-assumptions/output)" | tail -1 || true
fi

if step 4 || [ "$ONLY" = "4b" ]; then
    p1="$HERE/4-dependencies/prompt-stage1-extract.md"
    extractions=()
    [ "$ONLY" = "4b" ] || echo "4 · Dependency synthesis — stage 1, one run per document"
    for doc in "$HERE"/4-dependencies/inputs/doc-*.md; do
        name="$(basename "$doc" .md)"
        dest="$(out "4-dependencies/output-stage1/$name")"
        if [ "$ONLY" = "4b" ]; then
            [ -f "$dest" ] || { echo "Missing $dest — run use case 4 first." >&2; exit 1; }
        else
            run "$p1" "$dest" "$(with_inputs "$(prompt_of "$p1")" "$doc")"
        fi
        extractions+=("$dest")
    done
    echo "4 · Dependency synthesis — stage 2"
    p2="$HERE/4-dependencies/prompt-stage2-synthesize.md"
    run "$p2" "$(out 4-dependencies/output)" \
        "$(with_inputs "$(prompt_of "$p2")" "${extractions[@]}" "$HERE/4-dependencies/inputs/ownership-map.md")"
fi

if step 4 || [ "$ONLY" = "4c" ]; then
    echo "4 · From map to milestones - stage 3, back-scheduling"
    p3="$HERE/4-dependencies/prompt-stage3-milestones.md"
    stage3=("$(out 4-dependencies/output)" "$HERE/4-dependencies/architecture-review-notes.md"             "$(out 1-charter/output)" "$(out 3-assumptions/output)")
    for f in "${stage3[@]}"; do
        [ -f "$f" ] || { echo "Missing $f - run use cases 1, 3 and 4 first." >&2; exit 1; }
    done
    run "$p3" "$(out 4-dependencies/output-milestones)" "$(with_inputs "$(prompt_of "$p3")" "${stage3[@]}")"
fi

if step 5; then
    echo "5 · Persona-swarm pre-mortem — four lenses on the same corpus"
    corpus=("$(out 1-charter/output)" "$(out 2-alignment/output)" "$(out 3-assumptions/output)" \
            "$(out 4-dependencies/output)" "$(out 4-dependencies/output-milestones)"             "$HERE/4-dependencies/architecture-review-notes.md")
    for f in "${corpus[@]}"; do
        [ -f "$f" ] || { echo "Missing $f — run use cases 1-4 first." >&2; exit 1; }
    done
    for p in "$HERE"/5-premortem/prompt-*.md; do
        lens="$(basename "$p" .md | sed 's/^prompt-/output-/')"
        run "$p" "$(out "5-premortem/$lens")" "$(with_inputs "$(prompt_of "$p")" "${corpus[@]}")"
    done
fi

echo "Done."
