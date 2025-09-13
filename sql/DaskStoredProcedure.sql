DELIMITER $$

CREATE PROCEDURE sp_GetDaskTeklif (
    IN pSigortaTuru VARCHAR(50),
    IN pTcKimlik VARCHAR(11),
    IN pDogumTarihi DATE,
    IN pTelefon VARCHAR(20),
    IN pEmail VARCHAR(100),
    IN pAdresKodu VARCHAR(20),
    IN pAdres TEXT,
    IN pKatSayisi VARCHAR(50),
    IN pBrutMetre VARCHAR(50),
    IN pInsaatYili VARCHAR(50)
)
BEGIN
    DECLARE vBrut INT;
    DECLARE vTabanPrim DECIMAL(10,2);
    DECLARE vKatsayiYil DECIMAL(4,2);
    DECLARE vKatsayiKat DECIMAL(4,2);
    DECLARE vFiyat DECIMAL(10,2);

    -- m² sayıya çevir
    SET vBrut = CAST(pBrutMetre AS UNSIGNED);

    -- taban prim = m² * 20 TL
    SET vTabanPrim = vBrut * 20;

    -- İnşaat yılı katsayısı
    CASE 
        WHEN pInsaatYili = '1975 ve öncesi' THEN SET vKatsayiYil = 1.3;
        WHEN pInsaatYili = '1976-1999' THEN SET vKatsayiYil = 1.2;
        WHEN pInsaatYili = '2000-2006' THEN SET vKatsayiYil = 1.1;
        WHEN pInsaatYili = '2007-2018' THEN SET vKatsayiYil = 1.0;
        WHEN pInsaatYili = '2019 ve sonrası' THEN SET vKatsayiYil = 0.9;
        ELSE SET vKatsayiYil = 1.0;
    END CASE;

    -- Kat sayısı katsayısı
    CASE
        WHEN pKatSayisi = '1-3 arası' THEN SET vKatsayiKat = 1.0;
        WHEN pKatSayisi = '4-7 arası' THEN SET vKatsayiKat = 1.05;
        WHEN pKatSayisi = '8-11 arası' THEN SET vKatsayiKat = 1.1;
        WHEN pKatSayisi = '12-18 arası' THEN SET vKatsayiKat = 1.15;
        WHEN pKatSayisi = '18-25 arası' THEN SET vKatsayiKat = 1.2;
        ELSE SET vKatsayiKat = 1.0;
    END CASE;

    -- Fiyat hesapla
    SET vFiyat = vTabanPrim * vKatsayiYil * vKatsayiKat;

    -- Başvuru kaydet
    INSERT INTO DaskBasvurular
    (SigortaTuru, TcKimlik, DogumTarihi, Telefon, Email, AdresKodu, Adres, KatSayisi, BrutMetre, InsaatYili, HesaplananFiyat, BasvuruTarihi)
    VALUES
    (pSigortaTuru, pTcKimlik, pDogumTarihi, pTelefon, pEmail, pAdresKodu, pAdres, pKatSayisi, pBrutMetre, pInsaatYili, vFiyat, NOW());

    -- Teklifler
SELECT 'Allianz' AS Firma, vFiyat * 1.00 AS Fiyat, 'Standart paket' AS Aciklama
UNION
SELECT 'AXA', vFiyat * 1.10, 'Genişletilmiş paket'
UNION
SELECT 'Anadolu Sigorta', vFiyat * 0.95, 'Ekonomik paket'
UNION
SELECT 'Ak Sigorta', vFiyat * 1.05, 'Standart paket'
UNION
SELECT 'Doğa Sigorta', vFiyat * 1.02, 'Standart paket'
UNION
SELECT 'HDI Sigorta', vFiyat * 1.03, 'Standart paket'
UNION
SELECT 'Mapfre Sigorta', vFiyat * 1.04, 'Standart paket'
UNION
SELECT 'Türkiye Sigorta', vFiyat * 1.01, 'Standart paket'
UNION
SELECT 'Sompo Sigorta', vFiyat * 0.98, 'Ekonomik paket'
UNION
SELECT 'Neova', vFiyat * 0.97, 'Ekonomik paket'
UNION
SELECT 'Ray Sigorta', vFiyat * 1.00, 'Standart paket'
UNION
SELECT 'Quick Sigorta', vFiyat * 1.06, 'Genişletilmiş paket';

END$$

DELIMITER ;
