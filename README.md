# Audiobook Splitter

Este proyecto proporciona un script de Bash para dividir archivos de audiolibros (`.m4b`) en capítulos individuales basados en los metadatos internos del archivo. Es ideal para separar audiolibros largos en archivos más manejables.

## Características

- **Detección Automática de Capítulos**: Utiliza `ffprobe` para identificar los puntos de inicio y fin de cada capítulo.
- **División sin Recodificación**: Usa `ffmpeg` con `-c copy` para dividir el audio sin perder calidad y de manera muy rápida.
- **Modo Interactivo**: Si no especificas el archivo al ejecutar, el script te preguntará por la ruta.

## Requisitos previos

Necesitas tener instalados `ffmpeg` y `ffprobe` en tu sistema Linux.

```bash
# Para instalar en Ubuntu/Debian
sudo apt install ffmpeg
```

## Uso

1.  **Dar permisos de ejecución** (solo la primera vez):

    ```bash
    chmod +x split_m4b_files.sh
    ```

2.  **Ejecutar el script**:

    **Opción A: Pasando el archivo como argumento**

    ```bash
    ./split_m4b_files.sh "ruta/al/audiolibro.m4b"
    ```

    **Opción B: Modo interactivo**

    ```bash
    ./split_m4b_files.sh
    # El script te pedirá que introduzcas la ruta
    ```

    **Opción C: Desde la terminal de Linux**

    ```bash
    bash split_m4b_files.sh
    # El script te pedirá que introduzcas la ruta
    ```

## Resultado

El script creará una carpeta con el nombre del audiolibro en el mismo directorio donde se encuentra el archivo original. Dentro encontrarás los capítulos divididos enumerados secuencialmente.
