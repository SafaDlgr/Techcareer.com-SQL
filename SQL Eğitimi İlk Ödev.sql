

CREATE TABLE Books (
    book_id INT PRIMARY KEY,             
    title NVARCHAR(255) NOT NULL,       
    author NVARCHAR(200) NOT NULL,      
    genre NVARCHAR(50),                  
    price DECIMAL(10,2) CHECK (price >= 0),  
    stock INT CHECK (stock >= 0),            
    published_year INT CHECK (published_year BETWEEN 1900 AND 2026),
    added_at DATE
);


INSERT INTO Books (book_id, title, author, genre, price, stock, published_year, added_at)
VALUES
(1, 'Kayýp Zamanýn Ýzinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
(2, 'Simyacý', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
(3, 'Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
(4, 'Ýnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
(5, 'Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
(6, 'Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
(7, 'Hayvan Çiftliði', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
(8, '1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
(9, 'Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
(10, 'Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
(11, 'Baþlangýç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
(12, 'Atomik Alýþkanlýklar', 'J. Clear', 'kiþisel geliþim', 129.00, 28, 2018, '2025-09-03'),
(13, 'Zamanýn Kýsa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
(14, 'Þeker Portakalý', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
(15, 'Bir Ýdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');




-- 1. Tüm kitaplarýn title, author, price alanlarýný fiyatý artan þekilde sýralayarak listeleyin.

SELECT title, author, price 
FROM books
ORDER BY price;

-- 2. Türü 'roman' olan kitaplarý A?Z title sýrasýyla gösterin.

SELECT title,genre,author FROM books
WHERE genre = 'Roman'
ORDER BY title;

-- 3. Fiyatý 80 ile 120 (dahil) arasýndaki kitaplarý listeleyin (BETWEEN).

SELECT * FROM books
WHERE price BETWEEN 80 AND 120;

-- 4. Stok adedi 20’den az olan kitaplarý bulun (title, stock).

SELECT title, stock 
FROM books
WHERE stock < 20;

-- 5. title içinde 'zaman' geçen kitaplarý LIKE ile filtreleyin (büyük/küçük harf durumunu not edin).

SELECT * FROM books
WHERE title LIKE '%zaman%';

-- 6. genre deðeri 'roman' veya 'bilim' olanlarý IN ile listeleyin.

SELECT title, author, genre
FROM books
WHERE genre IN ('Roman','Bilim');

-- 7. published_year deðeri 2000 ve sonrasý olan kitaplarý, en yeni yýldan eskiye doðru sýralayýn.

SELECT title, author, published_year
FROM books
WHERE published_year >= 2000
ORDER BY published_year DESC;

-- 8. Son 15 gün içinde eklenen kitaplarý bulun (added_at tarihine göre).

SELECT title, author, added_at
FROM books
WHERE added_at >= DATEADD(day, - 15, GETDATE());

-- 9. En pahalý 5 kitabý price azalan sýrada listeleyin (LIMIT 5).

SELECT TOP 5 title, author, price
FROM books
ORDER BY price DESC

-- 10. Stok adedi 30 ile 60 arasýnda olan kitaplarý price artan þekilde sýralayýn.

SELECT title, author, price, stock
FROM books
WHERE stock BETWEEN 30 AND 60
ORDER BY price;