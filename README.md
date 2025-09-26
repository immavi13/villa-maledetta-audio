# Villa Maledetta - Audio (GitHub Pages)

Repository per ospitare gli effetti sonori della skill Alexa "Villa Maledetta".

## Come usare
1. Metti i tuoi effetti sonori **veri** (scaricati da librerie libere) nella cartella `audio/` con questi nomi:
   - `porta.mp3`, `vento.mp3`, `sting.mp3`, `book.mp3`, `paper.mp3`, `clock.mp3`
2. Se i file non sono nel formato giusto per Alexa, usa gli script di conversione inclusi (`convert_all.sh` su macOS/Linux o `convert_all.bat` su Windows).
3. Fai commit & push su GitHub. Abilita **GitHub Pages** dal branch `main` (root).
4. Gli URL saranno del tipo:
   `https://USERNAME.github.io/villa-maledetta-audio/audio/porta.mp3`

## Requisiti audio Alexa
- MP3 **mono**
- **CBR** 48–192 kbps (consigliato 128 kbps)
- **Sample rate** 24000 Hz (ok anche 22050 o 16000)
- Durata ≤ 240s, dimensione ≤ ~5MB
- Header `Content-Type: audio/mpeg` (GitHub Pages lo imposta da solo)

## ffmpeg
Scarica ffmpeg:
- macOS (Homebrew): `brew install ffmpeg`
- Windows: https://www.gyan.dev/ffmpeg/builds/ (aggiungi ffmpeg.exe al PATH)
- Linux: usa il package manager della tua distro
