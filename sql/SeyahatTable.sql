CREATE TABLE SeyahatBasvurular (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    SigortaTuru VARCHAR(50),
    TcKimlik VARCHAR(11),
    DogumTarihi DATE,
    Telefon VARCHAR(20),
    Email VARCHAR(100),
    Bolge VARCHAR(50),
    Ulke VARCHAR(50),
    Paket VARCHAR(50),
    AxaUrun VARCHAR(50),
    Pandemi VARCHAR(20),
    KapkacTeminat VARCHAR(20),
    SeyahatBaslangic DATE,
    SeyahatBitis DATE,
    Meslek VARCHAR(30),
    HesaplananFiyat DECIMAL(10,2),
    BasvuruTarihi DATETIME DEFAULT CURRENT_TIMESTAMP
);
