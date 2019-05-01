#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT=$DIR/..
DOCS=$(wslpath -w $ROOT/docs)
$ROOT/tools/mdbook.exe serve -o "$DOCS"
