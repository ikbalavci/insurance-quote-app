USE sigorta_db;

CREATE TABLE KaskoBasvurular (
    BasvuruId INT AUTO_INCREMENT PRIMARY KEY,
    SigortaTuru VARCHAR(50),
    TcKimlik VARCHAR(11),
    DogumTarihi DATE,
    Telefon VARCHAR(20),
    Email VARCHAR(100),
    PlakaSehri VARCHAR(25),
    Model VARCHAR(25),
    Marka VARCHAR(25),
    ModelYili INT,
    KullanimSekli VARCHAR(15),
    KullanimDetayi VARCHAR(15),
    MotorNo VARCHAR(50),
    SasiNo VARCHAR(50),
    YolcuSayisi INT,
    HesaplananFiyat DECIMAL(10,2),
    BasvuruTarihi DATETIME DEFAULT CURRENT_TIMESTAMP
);
