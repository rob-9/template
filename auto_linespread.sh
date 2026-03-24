#!/bin/bash
# Binary search for the largest \linespread that keeps resume.tex to one page.
# Usage:
#   ./auto_linespread.sh              # run once
#   ./auto_linespread.sh --watch      # re-run on every save

TEX_FILE="resume.tex"
LOG_FILE="${TEX_FILE%.tex}.log"
MIN_BOUND=0.70
MAX_BOUND=1.20
TOLERANCE=0.005

set_linespread() {
    sed -i '' "/% tighten line spacing/s/\\\\linespread{[0-9.]*}/\\\\linespread{$1}/" "$TEX_FILE"
}

get_pages() {
    pdflatex -interaction=nonstopmode "$TEX_FILE" > /dev/null 2>&1
    grep -oE "Output written on .* \([0-9]+ pages?" "$LOG_FILE" | grep -oE "[0-9]+" | head -1
}

optimize() {
    local MIN=$MIN_BOUND
    local MAX=$MAX_BOUND

    while (( $(echo "$MAX - $MIN > $TOLERANCE" | bc -l) )); do
        MID=$(echo "scale=4; ($MIN + $MAX) / 2" | bc)
        set_linespread "$MID"
        PAGES=$(get_pages)
        if [ "$PAGES" -le 1 ] 2>/dev/null; then
            MIN=$MID
        else
            MAX=$MID
        fi
    done

    set_linespread "$MIN"
    pdflatex -interaction=nonstopmode "$TEX_FILE" > /dev/null 2>&1
    echo "$(date +%H:%M:%S) — optimal \linespread: $MIN"
}

if [ "$1" = "--watch" ]; then
    echo "Watching $TEX_FILE for changes... (Ctrl+C to stop)"
    optimize
    fswatch -o "$TEX_FILE" | while read -r; do
        echo "Change detected, re-optimizing..."
        optimize
    done
else
    optimize
fi
