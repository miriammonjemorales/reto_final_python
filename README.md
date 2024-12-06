# reto_final_python


## Pre-requisitos
1 - Sistema Operativo Linux
1 - Docker
1 - Python3.10 o superior


## Instalación
Se proporcionan dos modos de instalación:
1 - Default: Contiene los paquetes para poder desplegar la aplicación en local. Se usará para el desarrollo con una Base de Datos local persistente
1 - Testing: Contiene los paquetes para poder ejecutar los tests. Se ejecutarán con una Base de Datos Sqlite in_memory

El modo "Default" se deberá instalar siempre. Para ejecutar los tests adicionalmente se tendrán que instalar los paquetes de "testing"

### Default
Para instalar el entorno local de desarrollo es necesario ejecutar el siguiente comando que:
1 - Creará un entorno virtual de Python
1 - Instalará las dependencias

```bash
make install
```

### Testing
Instalará las dependencias para los tests

```bash
make install_testing
```
