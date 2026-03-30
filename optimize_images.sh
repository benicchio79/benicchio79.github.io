#!/bin/bash

# Script para otimizar imagens do blog Divagar
# Redimensiona para largura máxima de 1000px e mantém proporção

echo "🚀 Otimizando imagens em assets/images/..."

# Pasta onde estão as imagens
IMG_DIR="assets/images"

# Verifica se a pasta existe
if [ ! -d "$IMG_DIR" ]; then
    echo "❌ Pasta $IMG_DIR não encontrada!"
    exit 1
fi

# Processa imagens JPG, JPEG e PNG
find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r img; do
    echo "📸 Processando: $img"
    
    # Obtém a largura atual da imagem
    width=$(magick identify -format "%w" "$img")
    
    # Se largura > 1000px, redimensiona
    if [ "$width" -gt 1000 ]; then
        echo "   ↳ Redimensionando de ${width}px para 1000px..."
        magick "$img" -resize 1000x -quality 85 "$img"
    else
        echo "   ↳ Largura $widthpx já adequada, apenas comprimindo..."
        magick "$img" -quality 85 "$img"
    fi
done

echo "✅ Otimização concluída!"
