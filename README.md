# Cerradura electrónica

## Descripción del producto
El producto consiste en una cerradura adaptable que puede ser activada mediante una variedad de opciones conectadas a una base de datos que permite la configuración de usuarios con sus respectivos permisos modificables. Entre las opciones mencionadas anteriormente se encuentran:

* Reconocimiento facial
* Huella dactilar
* Sistema RFID por tarjeta

El sistema implementará la huella dactilar y el RFID en la carcasa de la cerradura. Para el reconocimiento facial se hará uso de una aplicación con el fin de simplificar los requerimientos de hardware del producto. Adicionalmente, en la aplicación se administrará la cerradura, lo que incluye los usuarios registrados y huellas registradas en esta, adicionalmente, se puede configurar la cerradura para tener una unica o una doble autentificación en caso de que se necesiten mayores restricciones para el manejo de esta.
El elemento diferencial de nuestro producto a los demás sistemas que se encuentran en el mercado es que nuestra cerradura ofrece una experiencia personal al hacer uso de varios sistemas biometricos y una aplicación que permiten al usuario interactuar de manera directa con la cerradura. Adicionalemnte, nuestro producto incluye más perifericos que las que se encuentran en el mercado, esto causa una diversificación en el uso del sistema. 

## Requerimientos funcionales
* Uso de electroiman para controlar la apertura de la puerta.
* Reconocimiento facial desde el telefono como alternativa para abrir o cerrar la cerradura.
* Reconocimiento de huellas dactilares.
* Comunicación con base de datos remota a través de WiFi.
* Comunicación con dispositivos a través de bluetooth
* El dispositivo incluye el conversor de 120v/220v a 3.3v dentro de la caja.
* La lectura de huella dactilar y el reconocimiento facial puede realizarse por medio de la aplicación movil.
* En caso de que haya un corte en la energía, el sistema seguiŕa funcionando con baterias.

![alt text](/Diagrama.png)

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


