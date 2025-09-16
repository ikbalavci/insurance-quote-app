use sigorta_db;

CREATE TABLE PetBasvurular (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    SigortaTuru VARCHAR(50),
    TcKimlik VARCHAR(11),
    DogumTarihi DATE,
    Telefon VARCHAR(20),
    Email VARCHAR(100),
    PetAdi VARCHAR(30),
    PetDogumTarihi DATE,
    PetCinsiyet VARCHAR(10),
    PetTuru VARCHAR(20),     -- (Kedi / Köpek gibi)
    PetCinsi VARCHAR(30),
    PetChipNo VARCHAR(30),
    HesaplananFiyat DECIMAL(10,2),
    BasvuruTarihi DATETIME
);
