#!/bin/bash

# Comprobar si se proporciona el nombre del archivo o directorio
if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre_de_archivo_o_directorio>"
  exit 1
fi

# Leer el nombre del archivo o directorio y los nuevos permisos
archivo_o_directorio="$1"
echo "Introduce los nuevos permisos en formato octal (por ejemplo, 755):"
read nuevos_permisos

# Verificar si los nuevos permisos son válidos (números octales entre 000 y 777)
if ! [[ "$nuevos_permisos" =~ ^[0-7]{3}$ ]]; then
  echo "Los permisos deben ser un número octal de tres dígitos (por ejemplo, 755)."
  exit 1
fi

# Cambiar los permisos del archivo o directorio
chmod "$nuevos_permisos" "$archivo_o_directorio"

# Mostrar un mensaje de confirmación
echo "Los permisos de $archivo_o_directorio se han cambiado a $nuevos_permisos."

