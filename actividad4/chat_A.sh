#!/bin/bash

PIPE_A_B="/tmp/chat_pipe_A_B"

# Crear el named pipe si no existe
[ -p "$PIPE_A_B" ] || mkfifo "$PIPE_A_B"

exec 3<> "$PIPE_A_B"

echo "Chat A iniciado"

while true; do
    read -r message
    echo "A: $message" > "$PIPE_A_B"
    sync  # Forzar la escritura antes de continuar
    read -r response < "$PIPE_A_B"
    echo "B: $response"
done

exec 3>&-