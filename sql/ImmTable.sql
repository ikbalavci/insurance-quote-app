USE sigorta_db;

CREATE TABLE ImmBasvurular (
    BasvuruId INT AUTO_INCREMENT PRIMARY KEY,
    SigortaTuru VARCHAR(50),
    TcKimlik VARCHAR(11),
    DogumTarihi DATE,
    Telefon VARCHAR(20),
    Email VARCHAR(100),
    Plaka VARCHAR(20),
    RuhsatSeriNo VARCHAR(50),
    Marka VARCHAR(50),
    UretimYili INT,
    HesaplananFiyat DECIMAL(10,2),
    BasvuruTarihi DATETIME DEFAULT CURRENT_TIMESTAMP
);
