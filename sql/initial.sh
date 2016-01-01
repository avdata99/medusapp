#!/bin/bash

# empezar el repo
# en local puede ser que el user web no sea el que desarrolla, requiere 77
# en prod y con centos son muy putos los permisos, requiere 755

permisos="$1"

echo "PERMISOS: $permisos"

mkdir static/documents 
chmod $permisos static/documents

mkdir static/images
chmod $permisos static/images

mkdir static/company_documents
chmod $permisos static/company_documents

mkdir static/observador_documentos
chmod $permisos static/observador_documentos

mkdir static/documentos_cierre
chmod $permisos static/documentos_cierre

mkdir static/gobiernos_logo
chmod $permisos static/gobiernos_logo

mkdir static/observador_foto
chmod $permisos static/observador_foto