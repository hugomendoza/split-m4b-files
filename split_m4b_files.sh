#!/bin/bash

if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg no está instalado."
    echo "Para instalarlo, ejecuta: sudo apt install ffmpeg"
    exit 1
fi

if ! command -v ffprobe &> /dev/null; then
    echo "Error: ffprobe no está instalado (suele venir con ffmpeg)."
    exit 1
fi

if [ $# -eq 0 ]; then
    read -p "Introduce la ruta del archivo .m4b: " INPUT
else
INPUT="$1"
fi

if [ ! -f "$INPUT" ]; then
    echo "Error: El archivo no existe: $INPUT"
    exit 1
fi
BASENAME="${INPUT%.*}"
FILE_TITLE=$(basename "$BASENAME")
mkdir -p "$BASENAME"


# Extraer tiempos de capítulos
echo "Analizando capítulos..."
CHAPTER_TIMES=$(ffprobe -i "$INPUT" -v quiet -print_format csv -show_chapters | awk -F',' '{print $5}' | paste -sd,)

if [ -z "$CHAPTER_TIMES" ]; then
    echo "Error: No se encontraron capítulos en el archivo."
    exit 1
fi


ffmpeg -i "$INPUT" -f segment -segment_times "$CHAPTER_TIMES" -map 0:a -c copy -reset_timestamps 1 "$BASENAME/${FILE_TITLE}-%03d.m4b"

echo "Capítulos extraídos en la carpeta: $BASENAME"