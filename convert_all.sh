#!/usr/bin/env bash
# Converte tutti i file sorgente in MP3 compatibili Alexa con i nomi richiesti.
# Uso: ./convert_all.sh /path/ai/tuoi/suoni
# Richiede: ffmpeg

set -euo pipefail

SRC="${1:-}"
if [ -z "$SRC" ]; then
  echo "Uso: $0 /percorso/ai/suoni_originali"
  exit 1
fi

mkdir -p audio

convert() {
  in="$1"; out="$2"
  echo "-> Converto '$in' -> 'audio/$out'"
  ffmpeg -y -i "$in" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio/$out"
}

convert "$SRC/porta.*" porta.mp3 || true
convert "$SRC/vento.*" vento.mp3 || true
convert "$SRC/sting.*" sting.mp3 || true
convert "$SRC/book.*"  book.mp3  || true
convert "$SRC/paper.*" paper.mp3 || true
convert "$SRC/clock.*" clock.mp3 || true

echo "Fatto. Carica i file nella repo e abilita GitHub Pages."
