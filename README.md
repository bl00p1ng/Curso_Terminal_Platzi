# Curso de Introducción a la Terminal y Línea de Comandos

Apuntes del [Curso de Introducción a la Terminal y Línea de Comandos](https://platzi.com/clases/terminal/)

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

## - Flujos estándar

Son los canales por donde se ingresan y salen datos de un proceso.

- **Entrada**
- **Salida**
- **Error**

### Redirección

Cambiar el flujo estándar(entrada/salida) de un archivo (por default el teclado) a una opción distinta como por ejemplo un archivo.

```bash
command < file.txt # Redirecciona file.txt al comando especificado. (Redireccionar entrada)
ls > output.txt # Redirecciona la salida del comando a un archivo
ls -l >> file.txt # Redireccionar la salida del comando al final de un archivo ya existente.
```

### Pipes

Tomar la salida de un proceso y pasarsela como entrada a otro

```bash
ls -lh | more
```

## - Administración de procesos en background y foreground

- ### Correr procesos en segundo plano:

  Permite correr en segundo plano comandos cuya ejecución tarde un tiempo considerable, para poder así seguir usando la terminal minetras ese proceso se ejecuta.

  ```bash
  curl "https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso" $ # $ indica que se proceso se ejecute en segundo plano
  ```

  **Ctrl + Z** ➡ Enviar un comando al background

  ```bash
  fg # Recuperar el comando (mandarlo al foreground)
  ```

- ### Ver procesos que se estan ejecutando:

  - **ps:**

    Utilidad Batch para monitorear procesos

    ```bash
    ps # Procesos que YO estoy ejecutando
    ps ax # Procesos que estoy ejecutando YO y el SISTEMA
    ```

    

  - **top:**

    Utilidad interactiva para monitorear procesos y recursos del sistema

- ### Matar procesos:

  - Obtener identificador (PID) usando **ps** 

    ```bash
    kill -9 127 # -9 Indica que el proceso debe finalizar inmediatamente
    
    killall proccess # Hace lo mismo que el anterior sólo que en lugar del PID toma por argumento el nombre del archivo ejecutable que genera el proceso
    ```

## - Permisos sobre archivos:

- **Dueño:** la persona que creo el archivo.
- **Grupo:** usuarios que pueden acceder a ese archivo.
- **Otros:** que puede hacer con el archivo cualquier otro que no sea el dueño ni este en el grupo.

### Permisos:

Se consultan con:

```bash
ls -l
```



- **Lectura** ➡ r
- **Escritura** ➡ w
- **Ejecución** (depende de si el archivo es ejecutable) ➡ x