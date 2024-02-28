#!/bin/bash

PIPE_A_B="/tmp/chat_pipe_A_B"

# Crear el named pipe si no existe
[ -p "$PIPE_A_B" ] || mkfifo "$PIPE_A_B"

exec 3<> "$PIPE_A_B"

echo "Chat B iniciado"

while true; do
    read -r message < "$PIPE_A_B"
    echo "A: $message"
    echo -n "B: "  # Esperar entrada antes de responder
    read -r response
    echo "$response" > "$PIPE_A_B"
    sync  # Forzar la escritura antes de continuar
done

exec 3>&-
