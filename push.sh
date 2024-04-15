#!/bin/bash

# Verifica que se haya proporcionado un argumento VERSION
if [ $# -ne 1 ]; then
    echo "Usage: $0 <VERSION>"
    exit 1
fi

# Asigna el primer argumento a la variable VERSION
VERSION=$1

# Agrega todos los archivos al repositorio git
git add .

# Realiza un commit con el mensaje proporcionado por el usuario
git commit -m "Version $VERSION"

# Sube los cambios al repositorio remoto
git push
