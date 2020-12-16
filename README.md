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

  **Dueño**----------**Grupo**----------**Otros**

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

  

## - Manejo de Paquetes

**Administradores de paquetes:** simplifican el proceso de instalación de software. Reúnenfuentes para obtener paquetes de software y automatizan la tarea de descargar el software, moverlo a los directorios donde se encuentran los archivos ejecutables y configurar el software (añadir al PATH en las variables de entorno del sistema, instalar dependencias, etc). **Ejemplos de administradores de paquetes:**

- **apt:** Debian y derivadas  como Ubuntu.
- **zypper:** Suse Linux y derivadas.
- **rpm:** Fedora, RHEL y derivadas.
- **pacman:** Arch Linux y derivadas.

### Usando apt

```bash
sudo apt install lynx # sudo → otorga permisos root. apt install → indica que se quiere usar apt para instalar un programa; otras posibles opciones son update para refrescar las bases de datos de los repositorios de softare y remove para desinstalar un paquete. lynx → es el paquete a instalar
```

- **Paquetes binarios:** paquetes con binarios listos para ejecutarse.

- **Paquetes de lenguajes:** librerías y utilidades hechas para trabajar con determinado lenguaje. **Ejemplos:**
  - **pip:** Package Installer for Python. Gestor de paquetes y dependencias para Python.
  - **npm:** Node Package Manger. Gestor de paquetes y dependencias para  NodeJs.
  - **composer:** Gestor de paquetes y dependencias para PHP.

## - Herramientas de compresión y combinación de archivos

- **Comprimir archivos:**

  ```bash
  gzip db.sql # Creará un archivo comprimido con extención .gz
  gzip -d db.spl.gz # -d → indica que se quiere descomprimir el archivo.
  ```

- **Combinar archivos:**

  ```bash
  tar cf backup.tar backup/* # cf → (Create File) Indica que se va a crear un archivo. backup.tar → nombre del archivo donde se van a agrupar los demás. backup/* → Indica donde estan los archivos que se van a combinar
  
  tar tf backup.tar # tf → Visualizar el contenido que esta dentro del .tar
  
  tar xf backup.tar # xf → Desagrupar el archivo .tar
  ```

  **NOTA:** tar agrupa/combina los archivos, *NO* los comprime por defecto. Si se quiere agrupar y comprimir se usa el siguiente comando:

  ```bash
  tar czf backup.tgz backup/* # czf → comprimir el archivo usando gzip¨. backup.tgz → nombre del archivo donde se van a agrupar y comprimir los demás. backup/* → Indica donde estan los archivos que se van a combinar y comprimir
  
  tar xzf backup.tgz # Desagrupar y descomprimir el archivo
  ```

  

## - Herramientas de búsqueda de archivos

Principales herramientas para búsqueda de archivos:

- **locate:** permite buscar el archivo que se le especifique en todo el sistema de archivos. Funciona mediante una base de datos que se tiene que actualizar periódicamente.

  ```bash
  locate file.txt # Buscar el archivo
  sudo upadatedb # actualizar base de datos
  ```

  

- **whereis:** se usa para ubicar archivos binarios (comandos). Retorna el directorio donde esta guardado el ejecutable de un comando.

  ```bash
  whereis echo
  ```

- **find:** es la herramienta de búsqueda más completa y la vez la más compleja. Busca dentro del árbol de directorios que se le especifique usando una serie de criterios. **Ejemplos:**

  ```bash
  find . -user blooping -perm 644 ## . → Busca en el directorio actual. -user → busca los archivos que corresponden a ese usuario. -perm → busca los archivos que tengan esos permisos.
  
  find . -type f -mtime +7 # -type → buscar por tipo. f → establece el tipo para buscar sólo archivos. -mtime → buscar archivos que fueron modificados en cierto intervalo de tiempo. +7 → establece el intervalo de tiempo en más de 7 días.
  
  find . -type f -mtime +7 -exec cp {} ./backup \; # -exec → establece acciones a ejecutar con el(los) archivo(s) encontrado(s). {} → representa el(los) nombre(s) de el(los) archivo(s) encontrado(s). \; → indica el final del comando.
  ```

  

- ## Herramientas para interactuar a través de HTTP

  Dicho intercambio entre el PC y el servidor se puede dar mediante dos comandos:

  - **curl:** se utiliza para hacer *"pedidos crudos"*. Se hace la petición al servidor, se recibe la respuesta en HTTP y se muestra en la pantalla.

    ```bash
    curl https://platzi.com # Descarga el código HTML de la página solicitada.
    
    curl -v https://platzi.com | more # -v → muestra además del HTML la interacción por HTTP con el servidor.
    
    curl -v https://platzi.com > /dev/null # Mostrar sólo los encabezados HTTP
    ```

    

  - **wget:** es una herramienta un poco más compleja que realiza descargas a un servidor HTTP.

    ```bash
    wget https://www.php.net/distributions/php-7.3.10.tar.bz2
    ```

## - Acceso seguro a otras computadoras

Al conectarse de forma segura los comandos no viajan como texto plano, si no que son encriptados para evitar que cualquier agente malicioso interfiera. Para hacer eso se usa el comando **ssh** (Secure Shell)

```bash
ssh leeway-prod # leeway-prod → perfil de ssh predefinido. Dichos perfiles se definen en el archivo ~/.ssh/config. Ejemplo de configuración:
Host leewat-prod
	HostName 45.55.62.127
	User root
```

- **Enviar emails a través de la terminal:**

  ```bash
  echo "Hello World!" | mail -s "Test" human@example.com # -s → Define el asunto del email. 
  ```

  

## - Qué son y cómo se utilizan las variables de entorno

Es una definición global a la que todos los procesos tienen acceso para tener más información sobre el entorno en el que se esta trabajando, esa información puede ser cosas como el **PATH** que es una variable que almacena las rutas de los directorios que contienen archivos binarios que se pueden ejecutar desde la terminal.

Para ver las rutas que almacena esa esa variable se usa el comando:

```bash
echo $PATH # $ → Le indica al interprete de comandos que expanda el contenido de esa variable.
```

- ### Asignar variables de entorno:

  - **Para un comando:** crear una variable para el próximo comando que se va a ejecutar. No es muy común hacer esto puede ser útil para sobrescribir una variable sin que esto afecte a todos los comandos.

    ```bash
    VAR=valor commnad # command → Comando al que va a afectar dicha variable
    ```

     

  - **Para toda la sesión:** crea una asignación global

    ```bash
    export VAR=valor # VAR → Nombre de la variable.
    ```


## - Cómo y para qué escribir scripts en Bash

**Bash** no sólo es un interprete de comandos, también es un leguaje de programación, su extención es **.sh**. Esto permite ejecutar múltiples comandos con sólo correr un script facilitando enormemente la automatización de tareas.

```bash
#!/bin/bash #Indica cuál es el interpete de comandos que va a ejecutar el script.

mkdir /tmp/wordpress
tar czf /tmp/wordpress/wordpress.`date +%F`.tgz /usr/share/nginx/wordpress # `date +%F → Toma la salida del comando date y la agrega al nombre del archivo
mv /tmp/wordpress.`date +%F`.tgz /root/backups/
rmdir /tmp/wordpress
```

- Se pueden ejecutar scripts desde un archivo bash:

```bash
/root/backup_db.sh
/root/backup_core.sh
```

- Sintaxis básica de Bash Scripting.

```bash
#!/bin/bash

NEW_DIR=hello # Crear variables

if [ ! -d "/root/$NEW_DIR" ]; then # Crear condicional. -d → Verifica si existe el directorio
	mkdir /root/$NEW_DIR
fi # fi finaliza el if

cp backup_code.sh /root/$NEW_DIR/
echo "`date`: Todo listo!"
```

- Ejecutar Script:

  ```bash
  chmod u+x platzi.sh # Otorgar permisos de ejecución
  ./platzi.sh # Ejecutar el script
  ```

- Archivos de configuración de interprete de comandos. Se abren cada vez que se inicia sesión:

  - **/etc/environment:** definición de la variable $PATH

  - **.bashrc:** archivo de configuración de bash

    ```bash
    export PATH=$PATH:/home/platzi/ # Agregar directorio al PATH. Esto se pone en el archivo .bashrc
    
    source .bashrc # Refrescar el archivo en el sistema para tomar los cambios
    ```

    

## - Cómo y para qué dejar tareas programadas

Para programar tareas hay dos opciones:

- **at:** permite programar comandos tomando como referencia la fecha y hora actual.

  ```bash
  at now +2 minutes # Las tareas se ejectaran en 2 minutos contando desde ahora. Al ejecutar el comando se abre otro prompt donde se pueden poner todos los comandos que se quieren programar. Ctrl + d → Finalizar la programación de tareas
  ```

  Si el comando no funciona y arroja el error: *Can’t open /var/run/atd.pid to signal atd. No atd running?* Hay que iniciar los servicios de at y cron. Par ello hay que ejecutar lo siguiente:

  ```bash
  service --status # Revisar si los servicios estan activos
  sudo service atd start # Activar at
  sudo service cron atd # Activar cron
  ```

  

- **cron:** permite dejar comandos programados para que se ejecuten de forma periódica. Utiliza un archivo llamando **crontab**

  ```bash
  crontab -e # Permite ver la tareas que estan programadas y programar nuevas tareas.
  
  45 12 * * * echo "hola" > hola.txt # Primer valor → Minuto. Segundo Valor → Hora. Tercer valor → Día del mes. Cuarto valor → Mes. Quinto valor → Día de la semana. Sexto valor → Comando a ejecutar
  ```

