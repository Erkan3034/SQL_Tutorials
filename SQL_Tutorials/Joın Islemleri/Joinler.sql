create database joinler; -- joinler database'i oluşturalım

use joinler;

create table urunler
(
urunId int,
urunIsmi varchar(50)
);

create table satislar 
(
 musteriId int,
 musteriIsmi varchar(50),
 urunId int
);


-- ==================INSERT ISLEMLERI==============

INSERT INTO urunler (urunId,urunIsmi) 
VALUES
(1, 'Domates'),
(2, 'Mısır'),
(3, 'Patates'),
(4, 'Marul'),
(5, 'Kavun'),
(Null, Null);

select * from urunler;

-- =========satislar===========
INSERT INTO satislar (musteriId,musteriIsmi,urunId) 
VALUES
(1, 'Ahmet',Null),
(2, 'Mehmet' ,2),
(3, 'Murat',3),
(4, 'Ayşe',Null),
(5, 'Oya',4),
(6, 'Hüseyin',1);

select * from satislar;


-- ================================= INNER JOIN=================================

-- Satışlar ve Ürünler tablolarını birleştiren INNER JOIN sorgusu

SELECT * FROM satislar  -- satislar tablosundaki tüm sütunları seç(select edilen  tablo soldaki olur )
INNER JOIN urunler      -- urunler tablosuyla birleştir
ON satislar.urunId = urunler.urunId;  -- Birleştirme koşulu: her iki tablodaki urunId değerleri eşleşmeli


/*

-> FROM satislar:
   - Ana tablo olarak satislar tablosunu seçer

-> INNER JOIN urunler:
   - satislar tablosunu urunler tablosuyla birleştirir
   - Sadece EŞLEŞEN kayıtları getirir (ürünü olmayan satış veya satışı olmayan ürün gösterilmez)

-> ON satislar.urunId = urunler.urunId:
   - İki tablo arasındaki ilişkiyi tanımlar
   - satislar tablosundaki urunId ile urunler tablosundaki urunId eşleşmelidir

Örnek olaraak;
+---------+-----------+----------+------------+---------+-----------+------------+
| satisId | urunId    | miktar   | tarih      | urunId  | urunAdi   | fiyat      |
+---------+-----------+----------+------------+---------+-----------+------------+
| 1       | 101       | 2        | 2023-01-15 | 101     | Laptop    | 7999.99    |
| 2       | 102       | 1        | 2023-01-16 | 102     | Telefon   | 5999.99    |
+---------+-----------+----------+------------+---------+-----------+------------+

!!!!!!!!!!!!:
- INNER JOIN sadece iki tabloda da eşleşen kayıtları getirir
- Eşleşmeyen kayıtları görmek için LEFT JOIN veya RIGHT JOIN kullanmalısınız
- Aynı isimde sütunlar varsa (örneğin urunId), hangi tablodan geldiğini belirtmek iyi olur
*/



-- ================================= LEFT  JOIN=================================


-- SOL (LEFT) tablodaki TÜM kayıtları getir, sağ tabloda eşleşen varsa onları da ekle
SELECT * FROM satislar       -- Ana tablo (sol tablo)
LEFT JOIN urunler            -- Birleştirilecek tablo (sağ tablo)
ON satislar.urunId = urunler.urunId;  -- Birleştirme koşulu

/*
## LEFT JOIN Detaylı Açıklama:

1. ÇALIŞMA MANTIĞI:
   - Sol tablodaki (satislar) TÜM kayıtlar getirilir
   - Sağ tablodan (urunler) SADECE eşleşen kayıtlar eklenir
   - Eşleşme yoksa sağ tablo sütunları NULL olarak gelir

2. NE ZAMAN KULLANILIR?
   - Tüm satışları listelemek istediğinizde (ürün bilgisi olsun ya da olmasın)
   - Eksik/boş verileri tespit etmek için
   - "Hangi satışların ürün bilgisi eksik?" gibi sorulara cevap vermek için

3. ÖRNEK SONUÇ:
   +---------+--------+----------+------------+--------+----------+-------+
   | satisId | urunId | miktar   | tarih      | urunId | urunAdi  | fiyat|
   +---------+--------+----------+------------+--------+----------+-------+
   | 1       | 101    | 2        | 2023-01-15 | 101    | Laptop   | 7999 |
   | 2       | 102    | 1        | 2023-01-16 | 102    | Telefon  | 5999 |
   | 3       | 999    | 5        | 2023-01-17 | NULL   | NULL     | NULL | ← Ürünü silinmiş ama satış kaydı duruyor
   +---------+--------+----------+------------+--------+----------+-------+

4. INNER JOIN'DEN FARKI:
   - INNER JOIN sadece eşleşen kayıtları getirir
   - LEFT JOIN sol tablonun TÜM kayıtlarını getirir

5. PERFORMANS NOTU:
   - Büyük tablolarda dikkatli kullanın
   - Sadece ihtiyacınız olan sütunları seçmek (SELECT *) yerine belirli sütunları listelemek daha iyidir
   - WHERE koşulu ekleyerek sonuçları filtreleyebilirsiniz

6. PRATİK KULLANIM ÖRNEKLERİ:
   -- Sadece ürün bilgisi olmayan satışları bulma:
   SELECT satislar.* 
   FROM satislar LEFT JOIN urunler ON satislar.urunId = urunler.urunId
   WHERE urunler.urunId IS NULL;

   -- Belirli sütunları seçerek:
   SELECT s.satisId, s.tarih, u.urunAdi, u.fiyat
   FROM satislar s LEFT JOIN urunler u ON s.urunId = u.urunId;
*/


-- ================================= RIGHT  JOIN=================================
/*
  RIGHT JOIN sorgusu, iki tabloyu birleştirirken SAĞ TABLODAKİ TÜM KAYITLARI getirir
  Sol tablodan sadece eşleşen kayıtları ekler
*/
SELECT * FROM satislar       -- Birinci tablo (sol tablo) - satış kayıtları
RIGHT JOIN urunler           -- İkinci tablo (sağ tablo) - ürün listesi (TÜM kayıtlar buradan gelecek)
ON satislar.urunId = urunler.urunId;  -- Tabloları urunId alanına göre birleştir

/*
  DETAYLI AÇIKLAMA:
  
  1. ÇALIŞMA MANTIĞI:
     - Öncelikle urunler tablosundaki (sağ tablo) TÜM kayıtlar seçilir
     - Sonra satislar tablosundan (sol tablo) sadece urunId'si eşleşen kayıtlar eklenir
     - Eşleşme yoksa, satislar tablosuna ait sütunlar NULL değer alır

  2. KULLANIM AMACI:
     - Satışı yapılmayan ürünleri bulmak için (satislar.urunId IS NULL)
     - Ürünlerin tam listesini görmek ve hangilerinin satıldığını analiz etmek için
     - Raporlama amaçlı tüm ürünleri listelemek gerektiğinde

  3. ÖRNEK SONUÇ TABLOSU:
     +---------+--------+----------+------------+--------+-------------+-------+
     | satisId | urunId | miktar   | tarih      | urunId | urunAdi     | fiyat|
     +---------+--------+----------+------------+--------+-------------+-------+
     | 1       | 101    | 2        | 2023-01-15 | 101    | Laptop      | 7999 |
     | 2       | 102    | 1        | 2023-01-16 | 102    | Akıllı Telefon | 5999 |
     | NULL    | NULL   | NULL     | NULL       | 103    | Tablet      | 2999 | ← Satışı olmayan ürün
     +---------+--------+----------+------------+--------+-------------+-------+

  4. LEFT JOIN'DEN FARKI:
     - LEFT JOIN: Sol tablodaki tüm kayıtlar + eşleşen sağ tablo kayıtları
     - RIGHT JOIN: Sağ tablodaki tüm kayıtlar + eşleşen sol tablo kayıtları

  5. PERFORMANS NOTLARI:
     - Büyük tablolarda dikkatli kullanılmalıdır
     - Sadece ihtiyaç duyulan sütunları SELECT ile belirtmek performansı artırır
     - WHERE koşulu eklenerek sonuçlar filtrelenebilir

  6. PRATİK KULLANIM ÖRNEKLERİ:
     -- Sadece satışı yapılmayan ürünleri listeleme:
     SELECT urunler.*
     FROM satislar RIGHT JOIN urunler ON satislar.urunId = urunler.urunId
     WHERE satislar.urunId IS NULL;

     -- Belirli sütunlarla düzenlenmiş RIGHT JOIN örneği:
     SELECT u.urunId, u.urunAdi, u.fiyat, s.tarih, s.miktar
     FROM satislar s RIGHT JOIN urunler u ON s.urunId = u.urunId;
*/



