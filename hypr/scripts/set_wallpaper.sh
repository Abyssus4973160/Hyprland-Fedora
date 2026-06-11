#!/bin/bash

FOLDER="/home/abyssus00/Imágenes/Fondos"
INDEX_FILE="$HOME/.cache/swww-index"
IMAGES=($(find "$FOLDER" -type f \( -iname "*.jpeg" -o -iname "*.png" \) | sort))
TOTAL=${#IMAGES[@]}

# Leer índice actual
if [[ -f "$INDEX_FILE" ]]; then
    INDEX=$(cat "$INDEX_FILE")
else
    INDEX=0
fi

# Cambiar al siguiente fondo
NEXT_INDEX=$(( (INDEX + 1) % TOTAL ))
IMG="${IMAGES[$NEXT_INDEX]}"


# Cambiar el fondo con transición
# swww img "$IMG" --transition-type wipe --transition-angle 20 --transition-step 90 --transition-fps 60

# Guardar el nuevo índice
echo "$NEXT_INDEX" > "$INDEX_FILE"
