#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "🔍 Procurando imagens em posts..."

LOG_FILE="conversion_log.txt"
> $LOG_FILE

find _posts -name "*.md" | while read -r file; do
    echo -e "\n${YELLOW}Processando: $file${NC}"
    
    temp_file=$(mktemp)
    modified=0
    
    while IFS= read -r line; do
        if [[ "$line" =~ \!\[(.*)\]\((.*)\) ]]; then
            alt="${BASH_REMATCH[1]}"
            path="${BASH_REMATCH[2]}"
            
            echo "   Convertendo: ![${alt}](${path})"
            new_line="{% include image-with-caption.html src=\"${path}\" alt=\"${alt}\" %}"
            echo "$file: $line -> $new_line" >> $LOG_FILE
            modified=1
            echo "$new_line" >> "$temp_file"
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$file"
    
    if [ $modified -eq 1 ]; then
        mv "$temp_file" "$file"
        echo -e "${GREEN}   ✅ Arquivo atualizado${NC}"
    else
        rm "$temp_file"
        echo "   ℹ️ Nenhuma alteração"
    fi
done

echo -e "\n${GREEN}✅ Conversão concluída!${NC}"
echo "Log salvo em: $LOG_FILE"
