<p align="center">
  <a href="https://login.mundogaturro.com/">
    <img src="https://github.com/Desquised/mundogaturro-installers-linux/blob/main/.assets/ttbd0qgtaq9858dtrvqm3d2fnrxyfoz1.png?raw=true" width="400">
  </a>
</p>

<p align="center">
  <a href="https://github.com/Desquised/mundogaturro-installers-linux/">
    <img src="https://img.shields.io/github/downloads/Desquised/mundogaturro-installers-linux/total?style=flat-square">
  </a>
  <img src="https://img.shields.io/badge/platform-Linux-blue?style=flat-square">
  <img src="https://img.shields.io/badge/build-native-brightgreen?style=flat-square">
</p>

## Mundo Gaturro Desktop (Versión Linux)
Aplicación de escritorio para Mundo Gaturro desarrollada para ejecutarse de forma nativa en sistemas Linux.

### Descargas
#### Opciones disponibles:
- [Descargar Instalador (.deb)](https://github.com/Desquised/mundogaturro-installers-linux/raw/refs/heads/main/mundogaturro-installer-linux86.deb?download=) - Recomendado para distribuciones basadas en Debian (Ubuntu, Mint, etc).
- [Descargar Portable (.AppImage)](https://github.com/Desquised/mundogaturro-installers-linux/raw/refs/heads/master/mundogaturro-portable-linux86.AppImage?download=) - Ejecutable portable para cualquier distribución de Linux de 64 bits.

#### Requisitos:
- Arquitectura: Linux 64 bits (x86_64).
- Almacenamiento: ~350 MB libres.
- Conexión a Internet activa.

### Instalación e Indicaciones
#### Instrucciones para el instalador .deb:
- Si al hacer doble clic en el `.deb` se abre para extraer archivos en vez de iniciar la instalación, es probable que falte un gestor de paquetes gráfico como **gnome-software** o **gdebi**. Instala el que corresponda según tu distribución.
- Si no posees ninguno de los dos, puedes instalarlos desde la terminal con alguno de los siguientes comandos: `sudo apt install gdebi` o `sudo apt install gnome-software`.
- Una vez instalado el gestor, haz doble clic en el archivo `.deb` y sigue los pasos para la instalación.

#### Instrucciones para el archivo .AppImage:
- Haz clic derecho sobre el archivo descargado y selecciona **Propiedades**.
- En la pestaña de **Permisos**, marca la opción **"Permitir ejecutar el archivo como un programa"**.
- Ejecuta el archivo. Si el sistema lo requiere, utiliza el parámetro `--no-sandbox` desde la terminal.
- Otra opción mucho más rápida via terminal, es usar este comando estando en el directorio del archivo: `./MundoGaturro-Linux-Distribucion-FINAL.AppImage -no--sandbox`

#### Seguridad y Sandbox:
- El cliente utiliza el parámetro `--no-sandbox` internamente por motivos de compatibilidad con el cliente y el sistema operativo Linux. Windows no lo utiliza porque es más "flexible" que Linux en este aspecto.
- Esto reduce el nivel de aislamiento de la aplicación respecto al sistema, por lo que se recomienda utilizarlo únicamente si confías en el servicio web oficial y el origen de este instalador.

### Contacto:
- Reportar problemas técnicos: [GitHub Issues](https://github.com/Desquised/mundogaturro-installers-linux/issues)
- Soporte oficial del juego: [Instagram](https://www.instagram.com/rostovhia)

### Imágenes del cliente:
<img src="https://github.com/Desquised/mundogaturro-installers-linux/blob/main/.assets/g2a6boq5fbt120w7y3rhx88ux31n3pym.png?raw=true">
<img src="https://github.com/Desquised/mundogaturro-installers-linux/blob/main/.assets/kbz8w41iazsptuh0yqdatpruf6o4vron.png?raw=true">
<img src="https://github.com/Desquised/mundogaturro-installers-linux/blob/main/.assets/pzmrh6h4quy3zdob26qnfcucr4jvjhx8.png?raw=true">
