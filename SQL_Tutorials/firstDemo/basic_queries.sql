INSERT INTO personeller  (isim,soyad,yas,dogumTarihi) VALUES("Erkan" , "TURGUT", 21 ,"2003-01-01");


INSERT INTO personeller (isim, soyad, yas, dogumTarihi)
SELECT 'Serkan', 'TURGUT', 24, '2001-01-01'
FROM dual
WHERE NOT EXISTS (
    SELECT 1 FROM personeller 
    WHERE isim = 'Serkan' AND soyad = 'TURGUT'
);


-- set SQL_SAFE_UPDATES = 0;
-- DELETE FROM personeller 
-- WHERE
--     isim = 'Erkan';

SELECT * FROM personeller;

