# Curso de Introducción a la Terminal y Línea de Comandos

## - Los Comandos

- **Nombre de un programa**

- **Parámetros:** información adicional para la ejecución del programa. También conocidos como argumentos.

- **Modificadores**: alteran lo que el programa va a hacer. También conocidos como _flags_.

  ```bash
  commnad -flag1 -flag2 arg1 arg2
  
  ```

## - Archivos virtuales

- Punteros que apuntan (valga la redundancia) o otros directorios.
  - **..** ➡ Apunta al directorio anterior (Directorio padre).
  - **.** ➡ Apunta al directorio actual.

## - Utilidades batch

Programas que procesan texto y emiten el resultado

```bash
cat filename.txt # Mostrar el contenido completo de un archivo
head -n 5 filename.txt # Mostrar las primeras x líneas de un archivo
tail -n 5 filename.txt # Mostrar las últimas x líneas de un archivo
```

### Utilidades batch avanzadas

- **grep** ➡ Búsqueda por expresiones regulares

  ```bash
  grep hanks filename.txt # Busca la línea que contenga la palabra "hanks"
  grep -i hanks filename.txt # Búsqueda no case sentitive
  ```

- **sed** ➡ (Stream EDitor). Tratamiento de flujos de caracteres. Soporta expresiones regulares. Se usa mucho para reemplazar expresiones. No modifica el archivo si no que crea un nuevo flujo con las modificacones.

  ```bash
  sed 's/hanks/selleck/g' filename.txt # /s ➡ Sustituir hanks por selleck. /g ➡ Aplicar la sustitución a lo largo de todo el archivo
  ```

- **awk** ➡ Tratamiento de texto delimitado. Muy útil para trabajar con archivos estructurados, como archivos separados por comas, tabs, etc. Admite una especie de lenguaje de scripting que aumenta aún mas sus capacidades.

  ```bash
  awk -F ';' '{ print $1 }' filename.csv # -F establece el delimitador. { print $1 } Imprimir la primera columna
  awk -F ';' 'NR > 1 && $3 > 0 { print $1, $3 * $4 }' # NR número de la columna.
  ```

  