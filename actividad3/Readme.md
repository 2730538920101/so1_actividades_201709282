# CREACION DE UN SERVICIO DE Systemd EN LINUX

## Paso 1

Crear un script para el saludo que se mostrará al ejecutar el servicio  (saludo.sh)
y darle permisos de ejecucion al archivo con el comando: 

chmod +x [nombre del archivo]

## Paso 2

Crear el archivo de servicio con todos los parametros necesarios para su funcionamiento en systemd. (saludo.service) y copiar el archivo en la ruta de systemd (/etc/systemd/system/)

para saber el nombre de usuario y grupo a utilizar para ejecutar el servicio se pueden utilizar los comandos:

whoami (obtener el nombre del usuario que se utiliza para la ejecucion del service)

id -g -n (obtuene el ID del grupo que se utiliza para la ejecucion del service)

para copiar el archivo debemos estar en la ruta del archivo y ejecutar el comando:

sudo cp [nombre del archivo del servicio] /etc/systemd/system/

## Paso 3

Recargar la configuracion del systemd con el comando:

sudo systemctl daemon-reload

## Paso 4

Habilitar el servicio con el comando:

sudo systemctl enable [nombre del archivo del servicio]

## Paso 5

Arrancar el servicio con el comando:

sudo systemctl start [nombre del archivo del servicio]

## Paso 6

Validar el status del servicio con el comando:

sudo systemctl status [nombre del archivo del servicio]

## Paso 7

Verificar los logs del servicio con el comando:

sudo journalctl -u [nombre del archivo del servicio]

## Paso 8

Si se realizan cambios en el script se puede recargar el servicio con el comando:

sudo systemctl restart [nombre del archivo del servicio]

## Paso 9

Para para el servicio utilizamos el comando:

sudo systemctl stop [nombre del archivo del servicio]

## Paso 10 

Para deshabilitar el servicio utilizamos el comando:

sudo systemctl disable [nombre del archivo del servicio]

