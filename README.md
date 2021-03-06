# Cerradura electrónica

## Descripción del producto
El producto consiste en una cerradura electrónica casera de alta seguridad, la cuál permitirá al usuario tener 3 niveles de autenticación distintos para acceder a ella. También cuenta con la opción de registar más de un usuario previamente registrado en una base de datos. Los sensores encargados para la debida autenticación de los usuarios son: 

* Reconocimiento facial
* Huella dactilar
* Sistema RFID por tarjeta

El sistema implementará la huella dactilar y el RFID en la carcasa de la cerradura. Para el reconocimiento facial se hará uso de una aplicación con el fin de simplificar los requerimientos de hardware del producto. Adicionalmente, en la aplicación se administrará la cerradura, lo que incluye los usuarios registrados y huellas registradas en esta. Se puede configurar la cerradura para tener una única o una doble autentificación en caso de que se necesiten mayores restricciones para el manejo de la cerradura.
El elemento diferencial de nuestro producto a los demás sistemas que se encuentran en el mercado es la experiencia personal al hacer uso de varios sistemas biométricos y una aplicación que permiten al usuario interactuar de manera directa con la cerradura. Adicionalemnte, nuestro producto incluye más periféricos que las que se encuentran en el mercado, esto causa una diversificación en el uso del sistema. Otro vlor añadido es el costo vs prestaciones, ya que en el mercado cerraduras biométricas son costosas y solo poseen el lector de huellas como módulo de seguridad.

## Requerimientos funcionales
* Uso de cerradura electrónica para controlar la apertura de la puerta.
* Reconocimiento facial desde el teléfono como alternativa para abrir o cerrar la cerradura.
* Reconocimiento de huellas dactilares.
* Comunicación con base de datos remota a través de WiFi.
* Comunicación con dispositivos a través de bluetooth
* La lectura de huella dactilar y el reconocimiento facial puede realizarse por medio de la aplicación móvil.
* En caso de que haya un corte en la energía, el sistema seguirá funcionando con baterias.

![alt text](/images/bloques.png)

## Requerimientos no funcionales
* Debido al uso de la cerradura electrónica, la cerradura mecánica convencional no es necesaria, sin embargo, en caso de que el cliente lo desee, se pueden usar en conjunto.
* Los usuarios registrados de cada cerradura no pueden ser vistos/usados por usuarios externos al propietario.
* El producto debe adaptarse a diferentes tipos de cerraduras.
* El sistema de autenticación remoto debe poder ser utilizado en la mayor cantidad de modelos de teléfonos posible.
* La aplicación móvil del dispositivo debe estar disponible en inglés y español.
* Los datos solo podrán ser cambiados por el administrador de la cerradura.
* La cerradura está pensada para uso doméstico, esto considerando que el nivel de seguridad para uso en empresas o industrias debe ser mayor.
* El sistema podrá funcionar sin necesidad de conexión a internet.
* El sistema tendra un método de autentificación para los administradores de la cerradura.
* El sistema puede repararse rapidamente cambiando uno de los modulos, ademas el daño en uno de los modulos no inhabilita el sistema.
* La caja del producto debe ser resistente a golpes.
* El sistema no podrá ser desmontado desde la parte exterior de la puerta.
* Para garantizar la seguridad de datos de los usuarios, se utilizará encriptación en la base de datos del sistema.
* En caso de cortes de energía se deshabilitarán los módulos bluetooth y WiFi para maximizar la duración de la carga de la batería.
* Se le asignará un espacio de memoria interna al dispositivo para almacenar los datos necesarios de autenticación del huella dactilar y RFID en el caso de exista un corte en la energía y no se pueda utilizar el WiFi.


## Componentes Utilizados
* Capacitores: 0.1 uF, 22 uF, 10 uF, 0.3 uF, 100 pF, 47 uF y 100 uF.
* Resistencias: 10k Ohm, 62k Ohm, 3.3k Ohm, 47k Ohm, 100 Ohm.
* Inductores: 22 uH.
* LEDs.
* Diodos Rectificadores: SS34 y 1N5406.
* Diodos.
* ESP32 - WROVER.
* Módulo RFID RC522.
* Lector de Huella AS608.
* Elevador de Voltaje MT3608.
* Regulador de Voltaje AMS1117.
* Conector 01x02.
* Conector 01x03.
* Relé Sanyou SRD Form C.
* Switch.

## Características
* Se utilizan componentes superficiales con el fin de reducir el tamaño del circuito.  
* El circuito se diseña y se programa para mininizar el gasto de energia en sí, donde el mayor gasto de la energia está en la cerradura. 
* El circuito consiste del controlador ESP32, sus protección, indicadores y conexiones a los otros periféricos, como el lector de huella.
* El diseño del circuito fue pensado para hacerse de forma modular con la cerradura y sus periféricos.

## Diseño del circuito

Primero se parte del controlador a utilizar, en este caso el esp32.
Seguidamente se determinan los módulos a utilizar, el RFID, el sensor de huella.
Con esto presente se seleccionan los pines necesarios para los módulos, además se realiza la etapa de potencia para 
la cerradura. Se realiza la pcb en kicad. Se incluyen indicadores, LEDs, para cada función (Alerta on-off, conexión establecida con cada uno de los módulos) 
Importante. El diseño también se hizo modular en el programa kicad. 
Se incluyeron los agujeros para la sujeción de la placa y se realizó la pcb en allpcb.
Se utilizaron componentes smd.

### ESP32

El controlador esp32 fue utilizado porque facilita la comunicación WiFi y Bluetooth. Además su programación es através de 
Micropython o el ide de Arduino. Esto hace rápida la programación si existen las librerías para los sensores.

### Etapa de potencia
* modulo ams1117
Regulador lineal de alta eficiencia. Dispositivo de voltaje fijo para usarlo a 3.3v con corriente maxima de 1 amperio, temperatura de trabajo de -40 150, con voltaja entrada 4.75 para una salida de 3.3. Y Pérdidas de voltaje debidas al calor.
Para una entrada de voltaje entre 4.8 y 12 V en este ams1117-3.3 se consigue 3.3 V en la salida, utilizando los capacitores recomendados por el fabricante.
* modulo mt3608
El mt3608 es un conversor DC-DC conmutado tipo boost. Trabaja de 2V a 24V en la entrada, dispositivo de voltaje de salida variable. Además de una eficiencia del 97 %. El fabricante da un circuito para aplicación basica. Este trabaja a una frecuencia fija. Para las resistencias, se utiliza la siguiente relación deacuerdo con el voltaje de entrada.
Vout=Vref*(1+R1/R2). 
Para el inductor es recomendable utilizar uno de 4.7uH a 22uH.
En cuanto a los capacitores, dos capacitores iguales de  alrededor de los 22uF.
Tambien el fabricante sugiere un diodo shcottky para no interferir con la velocidad de funcionamiento del modulo mt3608.

### Cerradura
Para el circuito de la cerradura se utiliza un rele de 3v que se conencta a una de las salidas digitales del ESP32. Entre los terminales normalmente abiertos se conecta la cerradura y 12v que la alimentan, de forma que cuando el rele se enciende se energiza la cerradura. Por otro lado, dado que el rele y la cerradura utilizan enbobinados para funcionar, es necesario proteger el circuito de posibles corrientes parasitas que estas generen una vez dejen de estar energizadas, de esta forma se conecta un diodo entre GND y la entrada digital que se conecta al rele, y otro diodo entre GND y la conexión entre el rele y la cerradura.

### RFID
Para el lector RFID se utilizó el módulo comercial que incluye el sistema de modulación y demodulación de 13.56 MHz y la respectiva antena para la lectura. El módulo se comunica por SPI por lo que puede ser utilizado con el ESP32 sin problemas. La conexión a la placa se realiza mediante una serie de puertos donde se introducen los pines del RFID; trabaja con 3.3 voltios por lo que puede ser utilizado directamente con una alimentación de 5 voltios. El pin de alimentación tiene una conexión con un condensador para proteger el módulo y de allí al relé.

### Sensor de huella

El módulo utilizado es el as608, un módulo fácil de conseguir, el cual permite una programación sensilla con las librerías existentes,
Este módulo tiene una memoria y permite guardar y verificar las huellas ingresadas, además su comunicación es serial.

### LEDS de funcionamiento

Se incluyeron LEDs como indicadores, para saber si hay batería, 
Si hay WiFi o si está abierta o cerrada la cerradura.

### Programador

La programación se hizo con micropython porque Python es un lenguaje conocido y fácil de entender, además de tener 
las librerías necesarias para el proyecto, se utizo la ide Tommy de Linux y se subieron los diferentes programas con un computador cuyo
sistema operativo es Linux. 
Para el sensor de la huella, fue necesario buscar el tipo de programación que utiliza y 
como programarlo con Python, es lo más importante, después se utilizó la libreria del sensor correspondiente
y se estudió la librería para utilizarla con dos fines, guardas huellas y verificar huellas guardadas, con el fin 
de enviar un bit y abrir la cerradura.

## Programación
Para la programación se utiliza micropython con el IDE Thonny, a partir de esto, se establecieron las siguientes clases:

### Database
Con el fin de mantener una comunicación entre la aplicación móvil fue necesario diseñar una base de datos en firestore en la que se almacena el estado de la cerradura (abierto o cerrado), los usuarios propietarios, nombre personalizado de la cerradura y un id unico del producto. Dado que en micropython no se encuentra ninguna librería con soporte para firestore, se utilizaron operaciones CRUD y por practicidad a la hora de utilizar los recursos del ESP32, se manejo una arquitectura poco eficiente para la base de datos. De esta manera, cada documento cuenta con 2 valores (nombre e id) y 2 subdocumentos donde se almacena el estado de la cerradura y la cantidad de usuarios registrados en la cerradura.

A partir de esto, se estableció la clase database con las siguientes funciones:

* __init__: 
El constructor de la clase establece el URL de la base de datos junto con su API key. Recibe los parametros id, name, user y config; los 3 primeros corresponden a datos que se almacenan en la base de datos, mientras que config hace referencia a si es la primera vez que se conecta la cerradura y es necesario crear un nuevo documento en la base de datos.

* createDB:
Recibe los argumentos user, name e id. A partir de ellos crea los documentos necesarios en la base de datos para el futuro uso de la cerradura y aplicación.

* listener:
Para tener una comunicación constante con la base de datos, la cerradura constantemente consulta el estado de esta para evidenciar los cambios realizados desde la aplicación. Normalmente este proceso se realiza con websockets, pero, dada la falta de soporte en micropython y que es un ejercicio academico se opto por un metodo más practico pero menos eficiente.

### Config:
Esta clase es la primer en se ejecutada, se encarga de configurar la cerradura, ya sea o no la primera vez que se enciende. Para ello se realiza el siguiente procedimiento:


Si es la primera vez que se utiliza la cerradura, se genera un uuid y se scanean las redes wifi disponibles en la zona, posteriormente, se ejecuta un webserver al que se puede accerder a traves del wifi. Ingresando a la dirección 192.168.4.1 se accede a un formulario donde se pregunta el nombre de la cerradura, un correo para asociarla, y la red wifi con su contraseña. Una vez que se llena el formulario, el ESP32 intenta conectarse al WiFi. Posteriormente se almacenan los datos en un archivo JSON, en caso de que la conexión falle, la cerradura se reinicia y se repide el proceso.

Si no es la primera vez que se enciende la cerradura, se lee el archivo JSON en busca del SSID y la contraseña del WiFi para ser conectados.

Con esto en mente, se utilizan las siguientes funciones:

* __init__:

El constructor inicializa ambos modos de WiFi, es decir, como una estación o como un punto de acceso, luego lee el JSON, si el valor de UUID es nulo, genera uno nuevo y posteriormente reviza el parametro config, si este esta en True llama a la función connect y establece la conexión con el WiFi. En caso de que config este en False, scannea los SSID's cercanos e inicializa el webserver.

* scan:

Realiza la busqueda de las redes cercanas y retorna sus respectivos SSID's.

* connect:
Esta función se encarga de establecer la conexión con el WiFi, recibe un SSID y una contraseña e intenta conectarse en un lapso de 10 segundos, pasado este tiempo se da por hecho de que no fue posible realizar la conexión retornando el valor de False. En caso contrario retornarpa True.

* _httpHandlerSSIDGet:
Se encarga de envíar la lista de los SSID's al webserver.

* _httpHandlerDataPost:
Recibe los datos del formulario alojado en el webserver, una vez obtenidos llama a la función connect, y si esta retorna True, guarda los valores del formulario en el JSON. Finalmente reinicia el sistema.

* runServer:
Activa el WiFi en modo access point, utiliza las 2 funciones anteriores como route handlers e inicializa el servidos con los archivos de HTML, CSS y JS contenidos en la carpeta /www. Finalmente, inicia el servidor.

![alt text](/images/config.jpeg)

* stopServer:
Detiene el servidor.

* isConnected:
Es una función para conocer el estado del WiFi en un entorno externo a la clase. Esta sera usada posteriormente en el main del sistema.

* reset:
Se encarga de restablecer la cerradura a los valores de "fabrica", reescribiendo el JSON en valores iniciales.

### HTML, CSS y JavaScript
Con el HTML y CSS se crea un formulario sencillo y agradable a la vista. Posteriormente se ejecuta un script de JavaScript el cual recibe los datos de los SSID's y genera una lista de redes disponibles en un drop down. Cuando el formulario es completado, obtiene los valores de cada campo y los almacena en un JSON para ser enviado al "backend" del webserver.


### RFID

Esta clase maneja los diferentes UUID's de las tarjetas RFID registradas en la cerradura. Hace uso de la librería mfrc522 para controlar el sensor. Para administrar y configurar la cerradura se utiliza una tarjeta de configuración, en el archivo main se observará su uso.

* __init__:
El constructor se encarga de inicializar el sensor RC522 por medio de SPI, se establece el UUID de la tarjeta de configuración y el nombre del archivo de texto que almacena los RFIDs.

* check_card_code:
Recive un UUID de un RFID, abre el archivo con la lista de RFIDs guardados y compara si este valor se encuentra en dicha lista, en caso de que si, retornará True, de lo contrario False.

* getCard:
Obtiene el UUID de la tarjeta leida.

* getSecretCard:
Retorna el valor de la tarjeta de configuración.

### Fingerprint as608
Para este sensor se utilizaron las librerias pyfingerprint y machine. pyfingerprint tiene todas las instrucciones necesarias para comunicarse con el as608, además tiene  funciones importantes para utilizar el sensor para huella, como su almacenamiento y operación. Por otro lado la libreria machine permite configurar la comunicación seria con el esp32.
La libreria contiene una clase, que es necesaria para identificar el sensor, por lo tanto se debe crear esa clase para utilizar sus métodos y así hacer las lecturas necesarias.

* verifyPasswird():
Nos permite acceder al sensor mediante su contraseña, usualmente se utiliza la constraseña de fabrica. Esto se utiliza para saber si esta conectado el sensor.
* getTemplateCount():
Este metodo nos permite saber el numero de almacenamiento de las huellas.
* getStorageCapacity():
Este método nos da información de la capacidad de almacenamiento de una huella dada.
* readImage():
Este metodo simplemente lee lo que este en la superficie del sensor.
* searchTemplate():
Este metodo busca coincidencias de una huella leida con las huellas guardades.
* convertImage():
Convierte la imagen leida en un sistema de almacenamiento diferente para ser guardado.
* createTemplate():
Combina los caracteres previamente guardados, creando un template nuevo para ser almacenado. 
* storeTemplate():
Almacena un templade en una ubicacion dado de las 255 permitidas para este sensor.

Con los anteriores métodos fue posible guardar y verificar las huellas existentes para así utilizar la cerradura.

### Main
Este es el archivo que se ejecuta cuando se inicia la cerradura, primero se establece la frecuencia y el duty cicle para el PWM de los LEDS, luego se inicializa cada uno de ellos y se establece la comunicación con el sensor de huela AS608. Luego se establecen 2 funciones para generar un parpadeo en los LEDs:

* blinkLed:
Realiza un corto blink en el led recibido.

* blinkOn:
Por medio de un hilo para que nunca se detenga, se ejecuta un blink en el led de encendido, en caso de que el WiFi este conectado, el LED de este tambien parpadeara.

Luego se utiliza la función openLock que abre la cerradura durante 3 segundos. Posteriormente se inicializa la clase config, luego se lee el archivo JSON y se inicializa la base de datos, finalmente se inicializa la clase RFID. Luego se crea un bucle infinito que esta constantemente leyendo el RFID y el sensor de huella, en caso de que haya una coincidencia se llama a la función openLock. Si la tarjeta leida es la de configuración, la siguiente tarjeta o huella leida se guardan para que posteriormente sean usadas para abrir la puerta.

### Aplicación (IOS)
La aplicación fue realizada en Swift para plataformas con IOS y IPadOS (IPhone, IPod, IPad), puesto que este lenguaje, permite de manera sencilla utilizar los sensores biometricos del dispositivo (a diferencia de otros frameworks como react-native). Luego, la app tiene como proposito ser un intermediario entre la cerradura y el usuario, muestra las cerraduras que se encuentran en propiedad de la persona, para ello, utiliza la autentificación por email de Firebase, y posteriormente realiza busquedas en los diferentes documentos de forma que se encuentren coincidencias con el correo del usuario. A partir de esto, es posible abrir la cerradura deseada por medio de la autentificación proporcionada por IOS de FaceID.Se esperaba añadir más funciones como agregar o eliminar usuarios de una cerradura, pero por razones de tiempo no fue posible.

![alt text](/images/login.jpeg)
![alt text](/images/cerraduras.jpeg)
![alt text](/images/info.jpeg)
![alt text](/images/faceid.jpeg)

## Carcasa y construcción
La carcasa se divide en 2 partes, interna y externa, en otras palabras, por dentro y por fuera de la puerta. En la parte interna se encuentra la PCB junto con 4 baterias AA en seríe que suministran energía a la cerradura, estas se cubren con un acrilico para proteger el circuito. La cerradura (el selenoide) se encuentra por fuera de la caja con el fin de que pueda ser ubicada en la posición que el usuario desee, de esta manera no es necesario mover todo el sistema si se quiere cambiar la posición de la cerradura. En la parte externa se encuentran el lector RFID y el sensor de huella AS608. La carcasa fue diseñada en Fusion360 y posteriormente fabricada en impresión 3D en PLA, para ello se utilizó el software CURA como slicer y una Creality Ender 3 V2 como impresora.

![alt text](/images/cerradura1.jpeg)
![alt text](/images/cerradura2.jpeg)


## Errores y observaciones

A lo largo del desarrollo de la placa para la cerradura electrónica se encontraron distintos problemas, principalmente relacionados con el circuito, algunos de ellos son:

* Se obtuvo un error en la alimentación de la cerradura. A pesar de que el conversor entrega la diferencia de potencial requerida, la corriente para su correcto funcionamiento no era suficiente. Lo anterior debido a que la conexión que realizamos en el circuito fue entre el regulador fijo de 3.3v y la cerradura, cuando lo correcto debió ser conectar el conversor directamente entre la bateria y la cerradura.


* En el diseño original no se incluyó un transistor BJT conectado al relé, esto ocasionaba un problema ya que no se estaba alimentando al mismo con suficiente corriente, esto se relacionaba con el punto anterior y el problema de distribución de energía; la solución fue conectar un transistor 2n2222 al relé, lo que mostraba su funcionamiento correctamente. La conexión del BJT se hace para mantener uno de los principios requeridos, la integración de todos los módulos en la miisma carcasa, ya que otra solución pudo ser la externalización del módulo de la cerradura, lo que impedía llevar acabo dicho principio.

* Existió un error al hacer la conexión de una bobina en el circuito, esta se conectaba directamente a un diodo para lograr su funcionamiento, sin embargo, al hacer la conexión, se puso del lado del incorrecto del diodo, por lo que al probar el circuito, esta sección no respondía. La solución a esto fue sencilla, en este caso cortar la mala conexión y esmaltar la nueva conexion de los terminales en la bobina y el diodo para ubicarlos en el lado correcto solucionó el problema. 

* Respecto al sensor para huella as608 aunque la libreria pyfingerprint permite utilizarlp correctamente, hay que configurar su comunicación de recepción y transmisión de datos, la velocidad en baudios, los bit que se van a leer por lectura y los pines que se deben usar. La velocidad y los bits utilizados en la transmisión se puede encontrar en el datasheet y debe ser los que se indican, de lo controario no trabajaria correctamente.



