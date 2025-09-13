USE sigorta_db;

CREATE TABLE DaskBasvurular (
    BasvuruId INT AUTO_INCREMENT PRIMARY KEY,
    SigortaTuru VARCHAR(50),
    TcKimlik VARCHAR(11),
    DogumTarihi DATE,
    Telefon VARCHAR(20),
    Email VARCHAR(100),
    AdresKodu VARCHAR(20),
    Adres TEXT,
    KatSayisi VARCHAR(50),
    BrutMetre VARCHAR(50),
    InsaatYili VARCHAR(50),
    HesaplananFiyat DECIMAL(10,2),
    BasvuruTarihi DATETIME
);

