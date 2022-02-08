import mfrc522

class RFID:
    def __init__(self):
        self.MISO, self.MOSI, self.SCK, self.RST, self.SDA = 19, 23, 18, 4, 5
        self.card_secret_num = "0x41f29820"
        self.uuid_filename = "uuidCard.txt"
        self.rdr = mfrc522.MFRC522(self.SCK, self.MOSI, self.MISO, self.RST, self.SDA)
    

    def check_card_code(self, code_from_card="11111"):
        for line in open(self.uuid_filename, 'r'):
            if code_from_card in line.strip():
                print("Tarjeta reconocida")
                return True
            else:
                print("Tarjeta no reconocida")
        return False

    def write_to_file(self, text):
        with open(self.uuid_filename, 'a') as file:
            file.write("\n"+text)

    def getCard(self):
        return self.rdr.getCardValue()

    def getSecretCard(self):
        return self.card_secret_num