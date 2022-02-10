import mfrc522 #Importa la librería correspondiente a la placa RFID RC522

class RFID:
    def __init__(self):
        #Establece los números de los pines en el esp32 para cada conexión del RFID
        self.MISO, self.MOSI, self.SCK, self.RST, self.SDA = 19, 23, 18, 4, 5 
        #Código uuid de la tarjeta utilizada para cambiar el módulo RFID de lectura a escritura o viceversa
        self.card_secret_num = "0x41f29820" 
        #Archivo .txt donde se guardan los códigos uuid de las tarjetas
        self.uuid_filename = "uuidCard.txt" 
        self.rdr = mfrc522.MFRC522(self.SCK, self.MOSI, self.MISO, self.RST, self.SDA) 
    

    #La función utilizada para comparar el valor uuid de la  tarjeta leida con los registrados en el archivo .txt
    def check_card_code(self, code_from_card="11111"): 
        #Se establece el modo de lectura en el archivo escogido que contiene los códigos uuid
        for line in open(self.uuid_filename, 'r'): 
            if code_from_card in line.strip():
                #Si el código uuid de la tarjeta se encuentra en el archivo .txt devuelve un True, además de mostrar "Tarjeta reconocida" en consola
                return True 
        #Si el código uuid no se encuentra en el archivo .txt devuelve un False y muestra "Tarjeta no reconocida" en consola
        return False 

    #La función es utilizada para registrar en el archivo .txt el código uuid de las tarjetas que se acerquen al RFID
    def write_to_file(self, text): 
        with open(self.uuid_filename, 'a') as file: #Se abre el archivo en modo escritura para agregar los códigos
            #Por cada tarjeta que se acerque se añade su código uuid y realiza un salto de linea, de tal manera que los códigos queden en una columna
            file.write("\n"+text) 

    def getCard(self):
        #Función para obtener el código de la tarjeta que se acerca al RFID
        return self.rdr.getCardValue() 

    def getSecretCard(self):
        #Retorna el código escogido para cambiar el RFID de modo lectura a escritura
        return self.card_secret_num 