DELIMITER $$

CREATE PROCEDURE sp_GetPetTeklif (
    IN pSigortaTuru VARCHAR(50),
    IN pTcKimlik VARCHAR(11),
    IN pDogumTarihi DATE,
    IN pTelefon VARCHAR(20),
    IN pEmail VARCHAR(100),
    IN pPetAdi VARCHAR(30),
    IN pPetDogumTarihi DATE,
    IN pPetCinsiyet VARCHAR(10),
    IN pPetTuru VARCHAR(20),
    IN pPetCinsi VARCHAR(30),
    IN pPetChipNo VARCHAR(30)
)
BEGIN
    DECLARE vTabanPrim DECIMAL(10,2);
    DECLARE vKatsayiTuru DECIMAL(4,2);
    DECLARE vKatsayiYas DECIMAL(4,2);
    DECLARE vFiyat DECIMAL(10,2);
    DECLARE vPetYasi INT;

    -- Taban prim (örnek 1500 TL)
    SET vTabanPrim = 1500;

    -- Pet yaşı
    SET vPetYasi = TIMESTAMPDIFF(YEAR, pPetDogumTarihi, CURDATE());

    -- Pet türüne göre katsayı
    CASE
        WHEN pPetTuru = 'Kedi' THEN SET vKatsayiTuru = 0.9;
        WHEN pPetTuru = 'Köpek' THEN SET vKatsayiTuru = 1.1;
        ELSE SET vKatsayiTuru = 1.0;
    END CASE;

    -- Yaşa göre katsayı
    CASE
        WHEN vPetYasi <= 2 THEN SET vKatsayiYas = 0.9;
        WHEN vPetYasi BETWEEN 3 AND 7 THEN SET vKatsayiYas = 1.0;
        WHEN vPetYasi >= 8 THEN SET vKatsayiYas = 1.2;
        ELSE SET vKatsayiYas = 1.0;
    END CASE;

    -- Fiyat hesapla
    SET vFiyat = vTabanPrim * vKatsayiTuru * vKatsayiYas;

    -- Başvuru kaydet
    INSERT INTO PetBasvurular
    (SigortaTuru, TcKimlik, DogumTarihi, Telefon, Email, PetAdi, PetDogumTarihi, PetCinsiyet, PetTuru, PetCinsi, PetChipNo, HesaplananFiyat, BasvuruTarihi)
    VALUES
    (pSigortaTuru, pTcKimlik, pDogumTarihi, pTelefon, pEmail, pPetAdi, pPetDogumTarihi, pPetCinsiyet, pPetTuru, pPetCinsi, pPetChipNo, vFiyat, NOW());

    -- Teklif listesi döndür
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
