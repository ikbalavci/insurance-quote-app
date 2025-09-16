DELIMITER $$

CREATE PROCEDURE sp_GetMotosikletTeklif (
    IN pSigortaTuru VARCHAR(50),
    IN pTcKimlik VARCHAR(11),
    IN pDogumTarihi DATE,
    IN pTelefon VARCHAR(20),
    IN pEmail VARCHAR(100),
    IN pPlakaSehri VARCHAR(25),
    IN pModel VARCHAR(25),
    IN pMarka VARCHAR(25),
    IN pModelYili INT,
    IN pKullanimSekli VARCHAR(15),
    IN pKullanimDetayi VARCHAR(30),
    IN pMotorNo VARCHAR(50),
    IN pSasiNo VARCHAR(50)
)
BEGIN
    DECLARE vTabanPrim DECIMAL(10,2);
    DECLARE vKatsayiYil DECIMAL(4,2);
    DECLARE vFiyat DECIMAL(10,2);

    -- Taban prim (örnek: 2000 TL)
    SET vTabanPrim = 1000;

    -- Model yılı katsayısı
    CASE
        WHEN pModelYili <= 2000 THEN SET vKatsayiYil = 1.3;
        WHEN pModelYili BETWEEN 2001 AND 2010 THEN SET vKatsayiYil = 1.15;
        WHEN pModelYili BETWEEN 2011 AND 2020 THEN SET vKatsayiYil = 1.05;
        WHEN pModelYili >= 2021 THEN SET vKatsayiYil = 0.95;
        ELSE SET vKatsayiYil = 1.0;
    END CASE;

    -- Fiyat hesapla
    SET vFiyat = vTabanPrim * vKatsayiYil;


    -- Başvuru kaydet
    INSERT INTO motosikletbasvurular
    (SigortaTuru, TcKimlik, DogumTarihi, Telefon, Email, PlakaSehri, Model, Marka, ModelYili, KullanimSekli, KullanimDetayi, MotorNo, SasiNo, HesaplananFiyat, BasvuruTarihi)
    VALUES
    (pSigortaTuru, pTcKimlik, pDogumTarihi, pTelefon, pEmail, pPlakaSehri, pModel, pMarka, pModelYili, pKullanimSekli, pKullanimDetayi, pMotorNo, pSasiNo, vFiyat, NOW());

    -- Teklifler döndür
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
