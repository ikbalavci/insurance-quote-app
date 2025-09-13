DELIMITER $$

CREATE PROCEDURE sp_GetImmTeklif (
    IN pSigortaTuru VARCHAR(50),
    IN pTcKimlik VARCHAR(11),
    IN pDogumTarihi DATE,
    IN pTelefon VARCHAR(20),
    IN pEmail VARCHAR(100),
    IN pPlaka VARCHAR(20),
    IN pRuhsatSeriNo VARCHAR(50),
    IN pMarka VARCHAR(50),
    IN pUretimYili INT
)
BEGIN
    DECLARE vTabanPrim DECIMAL(10,2);
    DECLARE vKatsayiUretim DECIMAL(4,2);
    DECLARE vFiyat DECIMAL(10,2);

    -- Tabana prim belirle (örnek: sabit 500 TL)
    SET vTabanPrim = 500;

    -- Üretim yılı katsayısı
    CASE 
        WHEN pUretimYili <= 2000 THEN SET vKatsayiUretim = 1.3;
        WHEN pUretimYili BETWEEN 2001 AND 2010 THEN SET vKatsayiUretim = 1.1;
        WHEN pUretimYili >= 2011 THEN SET vKatsayiUretim = 1.0;
        ELSE SET vKatsayiUretim = 1.0;
    END CASE;

    -- Teklif fiyatı hesapla
    SET vFiyat = vTabanPrim * vKatsayiUretim;

    -- Başvuru kaydet
    INSERT INTO ImmBasvurular
    (SigortaTuru, TcKimlik, DogumTarihi, Telefon, Email, Plaka, RuhsatSeriNo, Marka, UretimYili, HesaplananFiyat, BasvuruTarihi)
    VALUES
    (pSigortaTuru, pTcKimlik, pDogumTarihi, pTelefon, pEmail, pPlaka, pRuhsatSeriNo, pMarka, pUretimYili, vFiyat, NOW());

    -- Teklifleri döndür
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
