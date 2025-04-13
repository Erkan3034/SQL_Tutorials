use kitaplar;

-- ALTER TABLE sql_data CHANGE COLUMN `ï»¿Kitap ID` KitapID VARCHAR(50); --Sütun ismi değiştirildi

-- SELECT  `Yazar ID` ,`Satis Tutari`  FROM sql_data ORDER BY `Satis Tutari`; -- satıs tutarından artandan azalana doğru.

SELECT * FROM sql_data WHERE `Sayfa Sayisi` > 500; -- sayfa sayısı 500'den büyük olanları verir.(Kosul)

SELECT `KitapID`, `Satis Adedi`, `Satis Tutari`  
FROM   sql_data   WHERE  `Satis Adedi` > 10.000   AND   `Satis Tutari` > 20.000; -- sql_data tablosundan iki koşulu sağlayan kayıtları getirmek için kullanılıyor


