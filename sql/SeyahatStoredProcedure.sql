DELIMITER $$

CREATE PROCEDURE sp_GetSeyahatTeklif (
    IN pSigortaTuru VARCHAR(50),
    IN pTcKimlik VARCHAR(11),
    IN pDogumTarihi DATE,
    IN pTelefon VARCHAR(20),
    IN pEmail VARCHAR(100),
    IN pBolge VARCHAR(50),
    IN pUlke VARCHAR(50),
    IN pPaket VARCHAR(50),
    IN pAxaUrun VARCHAR(50),
    IN pPandemi VARCHAR(20),
    IN pKapkacTeminat VARCHAR(20),
    IN pSeyahatBaslangic DATE,
    IN pSeyahatBitis DATE,
    IN pMeslek VARCHAR(30)
)
BEGIN
    DECLARE vTabanPrim DECIMAL(10,2);
    DECLARE vGunSayisi INT;
    DECLARE vKatsayiBolge DECIMAL(4,2);
    DECLARE vKatsayiPaket DECIMAL(4,2);
    DECLARE vKatsayiPandemi DECIMAL(4,2);
    DECLARE vKatsayiKapkac DECIMAL(4,2);
    DECLARE vFiyat DECIMAL(10,2);

    -- Taban prim
    SET vTabanPrim = 500;

    -- Seyahat gün sayısı
    SET vGunSayisi = DATEDIFF(pSeyahatBitis, pSeyahatBaslangic) + 1;

    -- Bölge katsayısı
    SET vKatsayiBolge = CASE 
        WHEN pBolge = 'Tüm Dünya' THEN 1.5
        WHEN pBolge = 'Tüm Avrupa Ülkeleri' THEN 1.2
        WHEN pBolge = 'Schengen Ülkeleri' THEN 1.1
        ELSE 1.0
    END;

    -- Paket katsayısı
    SET vKatsayiPaket = CASE
        WHEN pPaket = 'teminat1' THEN 1.0
        WHEN pPaket = 'teminat2' THEN 1.1
        WHEN pPaket = 'teminat3' THEN 1.2
        WHEN pPaket = 'teminat4' THEN 1.3
        WHEN pPaket = 'teminat5' THEN 1.5
        ELSE 1.0
    END;

    -- Pandemi katsayısı
    SET vKatsayiPandemi = CASE
        WHEN pPandemi = 'pandemi1' THEN 1.2
        WHEN pPandemi = 'pandemi2' THEN 1.0
        ELSE 1.0
    END;

    -- Kapkaç katsayısı
    SET vKatsayiKapkac = CASE
        WHEN pKapkacTeminat = 'Kapkaç dahildir' THEN 1.1
        WHEN pKapkacTeminat = 'Kapkaç hariçtir' THEN 1.0
        ELSE 1.0
    END;

    -- Fiyat hesapla
    SET vFiyat = vTabanPrim * vGunSayisi * vKatsayiBolge * vKatsayiPaket * vKatsayiPandemi * vKatsayiKapkac;

    -- Başvuruyu kaydet
    INSERT INTO SeyahatBasvurular
    (SigortaTuru, TcKimlik, DogumTarihi, Telefon, Email, Bolge, Ulke, Paket, AxaUrun, Pandemi, KapkacTeminat, SeyahatBaslangic, SeyahatBitis, Meslek, HesaplananFiyat, BasvuruTarihi)
    VALUES
    (pSigortaTuru, pTcKimlik, pDogumTarihi, pTelefon, pEmail, pBolge, pUlke, pPaket, pAxaUrun, pPandemi, pKapkacTeminat, pSeyahatBaslangic, pSeyahatBitis, pMeslek, vFiyat, NOW());

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
