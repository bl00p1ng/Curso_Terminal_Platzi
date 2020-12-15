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

Toman la salida de un proceso y se la pasan como entrada a otro

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



- **Lectura** → r

- **Escritura** → w

- **Ejecución** (depende de si el archivo es ejecutable) → x si es un directorio esta letra indica que se puede acceder a ese directorio.

- **d** → Indica que es un directorio

- **l** → Link. Es un puntero a otro archivo.

  Un - en los permisos significa que dicho permiso no esta disponible para dicho usuario, grupo u otros.

  **Ejemplo:**

  ```bash
  ls -l
  -rwxrwxrwx 1 blooping blooping    4390 Dec 15 11:29 README.md # En este caso la d esta excluida por lo que se trata de un archivo. El dueño tiene permisos de lectura, escritura y ejecución, al igual qu el grupo y los otros usuarios.
  
  # El primer conjunto de permisos son los del dueño, los otros son son los del grupo y los últimos son los permisos de cualquier otro usuario
  ```

  ### Modificar permisos:

  - **chmod:** es el más utilizado, se usa para cambiar el modo del archivo. Permite cambiar individualmente los permisos.

  - **chown:** cambia al usuario propietario de ese archivo.

  - **chgrp:** cambia el grupo de usuarios que puede acceder a ese archivo.

    ```bash
    chmod o-w file.txt # o → Indica que el cambio afectara a los otros usuarios que accedan a ese archivo. - → indica que se quiere quitar un permiso. w → es el permiso a quitar
    
    chmod +x backend.php # Al no especificar a quien afectaran los cambios, el permiso se otorga a todos los que tengan acceso al archivo. + → Inidca que se quiere añadir un permiso. x → el permiso que se quiere añadir
    ```

  ### Notación binaria:

  |  r   |  w   |  x   |       |
  | :--: | :--: | :--: | :---: |
  |  1   |  0   |  0   | **4** |
  |  1   |  1   |  0   | **6** |
  |  1   |  1   |  1   | **7** |

  **Aplicado a cada uno de los permisos disponibles:**

  **Dueño**                          **Grupo**                          **Otros**

  |  r   |  w   |  x   |  r   |  w   |  x   |  r   |  w   |  x   |         |
  | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :-----: |
  |  1   |  1   |  0   |  1   |  0   |  0   |  0   |  0   |  0   | **640** |
  |  1   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   | **400** |
  |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   | **777** |

  Esto se usa para hacer un cambio de todos los permisos (dueño, grupo, otros) en una sola operación.

  ```bash
  chmod 760 file.txt # 7 → El dueño tiene todos los permisos. 6 → El grupo no tiene permiso para ejecutar. 0 → Los otros usuarios no tienen ningún permiso sobre el archivo.
  ```

  El usuario **root** tiene permisos para prácticamente leer y escribir cualquier archivo del sistema. El comando **sudo** se usa para tener temporalmente permisos como usuario root.

  ```bash
  sudo chown www-data backend.php # Cambia el dueño del archivo por www-data
  
  sudo chgrp www-data backend.php # Cambia el grupo del archivo por www-data
  ```

  

