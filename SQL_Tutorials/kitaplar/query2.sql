-- select  * from yazar_isimleri;

-- =================== SELECT WHERE  "LIKE" ISLEMI =======================
-- SELECT  * FROM yazar_isimleri WHERE `Yazar İsmi` lIKE 'm%';  -- yazar ismi M ile başlayanlar.

-- Select * from yazar_isimleri Where `Yazar İsmi` like '%a'; -- Yazar ismi a ile bitenler.

-- Select * from yazar_isimleri Where `Yazar İsmi` like '%va%' ; -- isminin herhangi bir ksımında va geçenler.

-- =================== UPDATE ISLEMI ======================================

-- UPDATE yazar_isimleri SET `Yazar İsmi`= 'ERKAN TURGUT'
-- WHERE `Yazar İsmi` = 'Hüseyin Serkan Okkaya'; -- update islemi (Belirtilen yazar ismini ERKAN TURGUT olarak değiştir)

-- SELECT * FROM yazar_isimleri;

-- =================== DELETE ISLEMI ======================================

-- DELETE FROM  yazar_isimleri WHERE `Yazar İsmi` ='Perihan Atlı'; -- perihan atlı isimli yazarı sil.

-- SELECT * FROM yazar_isimleri;


-- =================== SÜTUN/KOLON EKLEME ISLEMI ======================================

-- 'yazar_isimleri' tablosuna yeni bir sütun eklemek için ALTER TABLE komutu kulşanılır

ALTER TABLE yazar_isimleri          -- Tablo yapısını değiştirmek için
ADD barcode VARCHAR(4);            -- 4 karakter uzunluğunda "barcode" adında yeni sütun ekler

/*
Bu SQL komutu:,
->  Mevcut 'yazar_isimleri' tablosunun yapısını değiştirir
-> Tabloya 'barcode' adında yeni bir sütun ekler
-> Bu sütun VARCHAR(4) tipindedir, yani:
   - Maksimum 4 karakter alabilir
   - Harf, rakam veya özel karakter içerebilir
   - Değerler tırnak içinde yazılmalıdır ('A123', 'BZ42' gibi)
*/


-- Eklediğimiz sütuna değer verelim(update edelim):

-- UPDATE yazar_isimleri set barcode = '1205';



-- =================== SÜTUN/KOLON SILME ISLEMI ======================================
-- 'yazar_isimleri' tablosundan 'barcode' sütununu silmek için ALTER TABLE komutu

-- ALTER TABLE yazar_isimleri  -- Tablo yapısını değiştirmek için
-- DROP COLUMN barcode;       -- 'barcode' adlı sütunu tamamen siler

/*
bu komut: 
->> Tablodan 'barcode' adlı sütunu ve tüm verilerini kalıcı olarak siler
->> Dikkat:
   - Bu işlemi geri alamayız
   - Sütundaki tüm veriler kaybolur
   - Sütuna bağlı indeksler veya kısıtlamalar varsa onlar da silinir
*/
