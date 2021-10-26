# Cerradura electrónica


## Requerimientos funcionales
* Uso de electroiman para controlar la apertura de la puerta.
* Reconocimiento facial desde el telefono como alternativa para abrir o cerrar la cerradura.
* Teclado integrado para el uso de código de apertura.
* Reconocimiento de huellas dactilares.
* Comunicación con base de datos remota a través de WiFi.
* Comunicación con dispositivos a través de bluetooth
* El dispositivo incluye el conversor de 120v/220v a 3.3v dentro de la caja.
* La lectura de huella dactilar y el reconocimiento facial puede realizarse por medio de la aplicación movil.
* En caso de que haya un corte en la energía, el sistema seguiŕa funcionando con baterias.

![alt text](/diagrama_de_bloques_2.png)

## Requerimientos no funcionales
* Debido al uso de la cerradura electrónica, la cerradura mecánica convencional no es necesaria, sin embargo, en caso de que el cliente lo desee, se pueden usar ambas en conjunto.
* Los usuarios registrados de cada cerradura no pueden ser vistos/usados por usuarios externos al propietario.
* El producto debe adaptarse a diferentes tipos de cerraduras.
* El sistema de autenticación remoto debe poder ser utilizado en la mayor cantidad de modelos de teléfonos posible.
* La aplicación movil del dispositivo debe estar disponible en ingles y español.
* Los datos solo podran ser cambiados por el administrador de la cerradura.
* La cerradura está pensada para uso doméstico, esto considerando que el nivel de seguridad para uso en empresas o industrias debe ser mayor.
* El sistema podrá funcionar sin necesidad de conexión a internet.
* El sistema tendra un metodo de autentificación para los administradores de la cerradura.
* El sistema puede repararse rapidamente cambiando uno de los modulos, ademas el daño en uno de los modulos no inhabilita el sistema.
* La caja del producto debe ser resistente a golpes.
* El sistema no podrá ser desmontado desde la parte exterior de la puerta.
* Para garantizar la seguridad de datos de los usuarios, se utilizará encriptación en la base de datos del sistema.
* En caso de cortes de energía se deshabilitarán los módulos bluetooth y WiFi para maximizar la duración de la carga de la batería de emergencias.
* Se le asignará un espacio de memoria interna al dispositivo para almacenar los datos necesarios de autenticación del huella dactilar y RFID en el caso de exista un corte en la energía y no se pueda utilizar el WiFi.


