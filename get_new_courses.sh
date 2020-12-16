#!/bin/bash

echo "⭳ Descargando Índice de cursos\n"

curl https://platzi.com/agenda/ > courses.html

grep 'scheduleItems:' courses.html | sed 's/, /\n/g' | grep title | sed 's/"title": /→ /g'

