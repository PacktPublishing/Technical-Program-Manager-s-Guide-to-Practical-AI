#!/usr/bin/env python3
"""
The quote gate from Chapter 5: every row of an assumption log must quote a sentence that is
actually in the scope document. Prints FOUND / NOT FOUND per row and a summary.

Usage: python check-quotes.py <assumption-log.md> [scope-document.md]
The scope document defaults to inputs/scope-document.md next to this script.
Exit 1 if any quote is not found.
"""
from pathlib import Path
import re
import sys


def normalise(text):
    """Compare quotes ignoring markdown emphasis, curly quotes and runs of whitespace."""
    text = text.replace("“", '"').replace("”", '"').replace("’", "'")
    text = re.sub(r"[*_`]", "", text)
    return re.sub(r"\s+", " ", text).strip()


def quotes_from_table(log_text):
    """Yield (row label, quote) from the first column of every markdown table row with a quote."""
    for line in log_text.splitlines():
        if not line.startswith("|") or re.match(r"^\|\s*:?-{2,}", line):
            continue
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        # Tolerate a leading row-number column.
        label, cell = ("", cells[0])
        if len(cells) > 1 and re.fullmatch(r"#?\d+\.?", cells[0]):
            label, cell = cells[0], cells[1]
        match = re.search(r'["“](.+?)["”]', cell)
        if match:
            yield label, match.group(1)
        elif cell and not cell.lower().startswith(("verbatim", "#")):
            yield label, cell


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(2)
    log = Path(sys.argv[1]).read_text(encoding="utf-8")
    scope_path = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(__file__).parent / "inputs" / "scope-document.md"
    scope = normalise(scope_path.read_text(encoding="utf-8"))

    found = missing = 0
    for label, quote in quotes_from_table(log):
        ok = normalise(quote).rstrip(".") in scope
        found += ok
        missing += not ok
        print(f"{'FOUND    ' if ok else 'NOT FOUND'} {label:>4} \"{quote[:90]}\"")

    total = found + missing
    print(f"\n{found} of {total} quotes found in {scope_path.name}; {missing} rejected at the quote gate.")
    sys.exit(1 if missing else 0)


if __name__ == "__main__":
    main()
