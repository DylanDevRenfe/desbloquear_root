#!/bin/bash

# Función para mostrar mensajes con formato
function show_message() {
    echo "#############################################"
    echo "#### $1 ####"
    echo "#############################################"
}

# Mostrar mensaje inicial
show_message "PASO 1 DESCARGAR DOCKER"

# Comando 1: Descargar la última imagen de Ubuntu
echo "Descargando la imagen de Docker para Ubuntu:latest..."
docker pull ubuntu:latest
if [ $? -eq 0 ]; then
    echo "Imagen descargada correctamente."
else
    echo "Error al descargar la imagen. Verifica tu conexión a internet."
    exit 1
fi

# Comando 2: Crear y ejecutar un contenedor con volumen montado
echo "Creando y ejecutando el contenedor llamado 'container'..."
docker run -dit --name container -v /:/mnt/root ubuntu
if [ $? -eq 0 ]; then
    echo "Contenedor creado y en ejecución."
else
    echo "Error al crear el contenedor. Verifica si Docker está instalado y funcionando."
    exit 1
fi

# Comando 3: Iniciar una sesión interactiva en el contenedor
echo "Iniciando una sesión interactiva en el contenedor..."
docker exec -dit container /bin/bash
if [ $? -eq 0 ]; then
    echo "Sesión interactiva iniciada. Puedes trabajar dentro del contenedor."
else
    echo "Error al iniciar la sesión en el contenedor."
    exit 1
fi

# Mensaje final
show_message "PROCESO COMPLETADO"
