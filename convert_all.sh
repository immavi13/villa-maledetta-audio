#!/usr/bin/env bash
set -euo pipefail

INPUT_DIR="${1:-audio}"
OUT_DIR="$INPUT_DIR"

need=(porta vento sting book paper clock)

# Verifica ffmpeg
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "Errore: ffmpeg non trovato. Installa con: brew install ffmpeg"
  exit 1
fi

for name in "${need[@]}"; do
  # trova il primo file esistente fra mp3/wav/m4a/ogg
  src=""
  for ext in mp3 wav m4a ogg; do
    f="$INPUT_DIR/$name.$ext"
    if [ -f "$f" ]; then src="$f"; break; fi
  done

  if [ -z "$src" ]; then
    echo "Manca $name.{mp3|wav|m4a|ogg} in $INPUT_DIR — salto."
    continue
  fi

  out="$OUT_DIR/$name.mp3"
  tmp="$OUT_DIR/$name.tmp.mp3"     # <<— estensione mp3 PRIMA di .tmp

  echo "Converto $src -> $out"
  ffmpeg -y -i "$src" -ar 22050 -ac 1 -b:a 48k -codec:a libmp3lame -f mp3 "$tmp"
done

echo "Fatto. Ricordati di fare commit & push."