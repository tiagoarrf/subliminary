#!/bin/bash

# Verifica se todos os argumentos foram fornecidos
if [ "$#" -ne 3 ]; then
  echo "Uso: $0 <imagem_original.png> <texto> <imagem_saida.png>"
  exit 1
fi

imagem_original="$1"
texto="$2"
imagem_saida="$3"

# Converter o texto para uma sequência de bytes
bytes_texto=$(echo -n "$texto" | xxd -p)

# Ler os bytes da imagem PNG
bytes_imagem=$(xxd -p "$imagem_original")

# Concatenar os bytes do texto na imagem
bytes_ocultos="$bytes_imagem$bytes_texto"

# Converter os bytes de volta para o formato binário
echo "$bytes_ocultos" | xxd -r -p > "$imagem_saida"

echo "Esteganografia concluída. Imagem de saída: $imagem_saida"
