#!/bin/bash

# 1. Averiguar si la ventana activa ya es flotante (0 = no, 1 = sí)
IS_FLOATING=$(hyprctl activewindow | grep "floating:" | awk '{print $2}')

# 2. Comprobar el estado de la ventana
if [ "$IS_FLOATING" -eq 0 ]; then
    # SI NO ES FLOTANTE (está en modo mosaico): la convertimos a flotante con tamaño personalizado

    # Obtener la clase de la ventana
    WINDOW_CLASS=$(hyprctl activewindow | grep "class:" | awk '{print $2}')

    # Poner en modo flotante
    hyprctl dispatch setfloating

    # Pausa para procesar
    sleep 0.05

    # Aplicar tamaño según la clase
    case $WINDOW_CLASS in
        "cava")
            hyprctl dispatch resizeactive exact 900 100
            ;;
        "kitty")
            hyprctl dispatch resizeactive exact 550 300
            ;;
        "Thunar")
            hyprctl dispatch resizeactive exact 1000 650
            ;;
        *) # Caso por defecto
            hyprctl dispatch resizeactive exact 800 500
            ;;
    esac

    # Centrar la ventana
    hyprctl dispatch centerwindow

else
    # SI YA ES FLOTANTE: la devolvemos al modo mosaico
    hyprctl dispatch settiled
fi
