#!/bin/bash
NEW_DIR=hello # Crear variables

if [ ! -d "/root/$NEW_DIR" ]; then # Crear condicional. -d → Verifica si existe el directorio
		mkdir /root/$NEW_DIR
fi # fi finaliza el if

cp backup_code.sh /root/$NEW_DIR/
echo "`date`: Todo listo!"
