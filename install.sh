#!/bin/bash

# =====================================================================
# Mundo Gaturro Native Linux Installer - One-Liner Script
# =====================================================================

set -e

# Colores para la terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================================${NC}"
echo -e "${BLUE}   Iniciando Instalador de Mundo Gaturro para Linux   ${NC}"
echo -e "${BLUE}=====================================================${NC}"

# 1. Verificar si es Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo -e "${RED} Error: Este instalador es exclusivo para Linux.${NC}"
    exit 1
fi

# 2. Verificar arquitectura (solo 64 bits)
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ]; then
    echo -e "${RED} Error: Mundo Gaturro solo es compatible con Linux de 64 bits.${NC}"
    exit 1
fi

# 3. Preparar archivos temporales
TEMP_DEB="/tmp/mundogaturro-installer.deb"
REPO_URL="https://github.com/Desquised/mundogaturro-installers-linux/blob/main/mundogaturro-installer-linux86.deb?raw=true"

# 4. Descargar el paquete
echo -e "${GREEN} Descargando el instalador oficial...${NC}"
curl -L -o "$TEMP_DEB" "$REPO_URL"

# 5. Instalar el paquete
echo -e "${GREEN} Instalando Mundo Gaturro (requiere permisos de sudo)...${NC}"
if ! sudo apt install -y "$TEMP_DEB"; then
    echo -e "${RED} Error al instalar. Intentando resolver dependencias faltantes...${NC}"
    sudo apt --fix-broken install -y
    sudo apt install -y "$TEMP_DEB"
fi

# 6. Crear acceso directo en el escritorio
echo -e "${GREEN}  Creando acceso directo en el escritorio...${NC}"

# Obtener el directorio del escritorio de forma segura
if [ -n "$SUDO_USER" ]; then
    USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
    DESKTOP_DIR=$(sudo -u "$SUDO_USER" xdg-user-dir DESKTOP 2>/dev/null || echo "$USER_HOME/Escritorio")
    if [ ! -d "$DESKTOP_DIR" ]; then
        DESKTOP_DIR="$USER_HOME/Desktop"
    fi
    CURRENT_USER="$SUDO_USER"
else
    DESKTOP_DIR=$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Escritorio")
    if [ ! -d "$DESKTOP_DIR" ]; then
        DESKTOP_DIR="$HOME/Desktop"
    fi
    CURRENT_USER=$(whoami)
fi

SHORTCUT_PATH="$DESKTOP_DIR/gaturro-desktop.desktop"

if [ -d "$DESKTOP_DIR" ]; then
    # Copiar el archivo usando sudo por si acaso no tenemos permisos en la ruta de origen
    sudo cp /usr/share/applications/gaturro-desktop.desktop "$SHORTCUT_PATH"
    
    # Asignar los permisos correctos al usuario actual
    sudo chown "$CURRENT_USER":"$CURRENT_USER" "$SHORTCUT_PATH"
    
    # Asegurar que el archivo sea ejecutable (crítico para XFCE, KDE, etc.)
    sudo chmod 755 "$SHORTCUT_PATH"
    sudo chmod a+x "$SHORTCUT_PATH"
    
    # Intentar marcar como confiable para GNOME/Cinnamon
    if [ -n "$SUDO_USER" ]; then
        sudo -u "$SUDO_USER" gio set "$SHORTCUT_PATH" metadata::trusted yes 2>/dev/null || true
        sudo -u "$SUDO_USER" gio set "$SHORTCUT_PATH" metadata::trusted true 2>/dev/null || true
    else
        gio set "$SHORTCUT_PATH" metadata::trusted yes 2>/dev/null || true
        gio set "$SHORTCUT_PATH" metadata::trusted true 2>/dev/null || true
    fi
    
    echo -e "${GREEN} Acceso directo creado y parcheado en: $SHORTCUT_PATH${NC}"
else
    echo -e "${RED} No se pudo encontrar la carpeta del escritorio para crear el acceso directo.${NC}"
fi

# 7. Limpieza
echo -e "${GREEN} Limpiando archivos temporales...${NC}"
rm -f "$TEMP_DEB"

echo -e "${BLUE}=====================================================${NC}"
echo -e "${GREEN} ¡Instalación completada con éxito!${NC}"
echo -e "Ya puedes encontrar ${BLUE}MundoGaturro${NC} en tu menú de aplicaciones."
echo -e "${BLUE}=====================================================${NC}"
