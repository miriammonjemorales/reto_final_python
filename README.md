# Reto final Python

Este documento describe como prepara el entorno local para reto_final_python


## Pre-requisitos
1. Sistema Operativo Linux
1. Docker
1. Python3.9 o superior
1. Make (Deberá instalarse a nivel de sistema)


## Instalación
Se proporcionan dos modos de instalación:
1. Basic: Contiene los paquetes imprescindibles para poder desplegar la aplicación. Se usará para el desarrollo con una Base de Datos local persistente
1. Testing: Contiene los paquetes para poder ejecutar los tests. Se ejecutarán con una Base de Datos Sqlite in_memory

El modo "Basic" se deberá instalar siempre. Para ejecutar los tests se deberán instalar los paquetes de "testing"

### Basic
Para instalar el entorno local de desarrollo es necesario ejecutar el siguiente comando que:
1. Creará un entorno virtual de Python
1. Instalará las dependencias

```bash
make install
```

### Testing
Instalará las dependencias para los tests

```bash
make install_testing
```


## Inicialización de la base de datos
La base de datos se deberá inicializar para poder trabajar con ella en local. Para ello debemos levantarla con:

```bash
docker compose up -d
```

Una vez levantada debemos crear los compomentes básicos:

```bash
make install_db
```


## Ejecución de aplicación
Para ejecutar la aplicación debemos primero levantar la base de datos (previamente inicializada) y a continuación usaremos:

```bash
# Si la base de datos no ha sido levantada aún
docker compose up -d

make run_dev
```


## Ejecución de tests
Para ejecutar los tests debemos tener instalado el modo "testing". El siguiente comando ejecutará todos los tests.

```bash
make run_tests
```
