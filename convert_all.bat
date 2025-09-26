@echo off
REM Converte i file in MP3 compatibili Alexa (richiede ffmpeg.exe nel PATH)
REM Uso: convert_all.bat C:\percorso\ai\suoni_originali

if "%~1"=="" (
  echo Uso: convert_all.bat C:\percorso\ai\suoni_originali
  exit /b 1
)

set SRC=%~1
if not exist audio mkdir audio

echo Converto porta -> audio\porta.mp3
ffmpeg -y -i "%SRC%\porta.*" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio\porta.mp3"

echo Converto vento -> audio\vento.mp3
ffmpeg -y -i "%SRC%\vento.*" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio\vento.mp3"

echo Converto sting -> audio\sting.mp3
ffmpeg -y -i "%SRC%\sting.*" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio\sting.mp3"

echo Converto book -> audio\book.mp3
ffmpeg -y -i "%SRC%\book.*" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio\book.mp3"

echo Converto paper -> audio\paper.mp3
ffmpeg -y -i "%SRC%\paper.*" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio\paper.mp3"

echo Converto clock -> audio\clock.mp3
ffmpeg -y -i "%SRC%\clock.*" -ar 24000 -ac 1 -b:a 128k -codec:a libmp3lame "audio\clock.mp3"

echo Fatto. Carica i file nella repo e abilita GitHub Pages.
