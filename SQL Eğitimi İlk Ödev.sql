

CREATE TABLE Books (
    book_id INT PRIMARY KEY,             
    title NVARCHAR(50) NOT NULL,       
    author NVARCHAR(50) NOT NULL,      
    genre NVARCHAR(50),                  
    price DECIMAL(10,2) CHECK (price >= 0),  
    stock INT CHECK (stock >= 0),            
    published_year INT CHECK (published_year BETWEEN 1900 AND 2025),
    added_at DATE NOT NULL
);


INSERT INTO Books (book_id, title, author, genre, price, stock, published_year, added_at)
VALUES
(1, 'Kayıp Zamanın İzinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
(2, 'Simyacı', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
(3, 'Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
(4, 'İnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
(5, 'Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
(6, 'Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
(7, 'Hayvan Çiftliği', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
(8, '1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
(9, 'Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
(10, 'Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
(11, 'Başlangıç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
(12, 'Atomik Alışkanlıklar', 'J. Clear', 'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
(13, 'Zamanın Kısa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
(14, 'Şeker Portakalı', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
(15, 'Bir İdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');




-- 1. Tüm kitapların title, author, price alanlarını fiyatı artan şekilde sıralayarak listeleyin.

SELECT title, author, price 
FROM books
ORDER BY price;

-- 2. Türü 'roman' olan kitapları A?Z title sırasıyla gösterin.

SELECT title,genre,author FROM books
WHERE genre = 'Roman'
ORDER BY title;

-- 3. Fiyatı 80 ile 120 (dahil) arasındaki kitapları listeleyin (BETWEEN).

SELECT * FROM books
WHERE price BETWEEN 80 AND 120;

-- 4. Stok adedi 20’den az olan kitapları bulun (title, stock).

SELECT title, stock 
FROM books
WHERE stock < 20;

-- 5. title içinde 'zaman' geçen kitapları LIKE ile filtreleyin (büyük/küçük harf durumunu not edin).

SELECT * FROM books
WHERE title LIKE '%zaman%';

-- 6. genre değeri 'roman' veya 'bilim' olanları IN ile listeleyin.

SELECT title, author, genre
FROM books
WHERE genre IN ('Roman','Bilim');

-- 7. published_year değeri 2000 ve sonrası olan kitapları, en yeni yıldan eskiye doğru sıralayın.

SELECT title, author, published_year
FROM books
WHERE published_year >= 2000
ORDER BY published_year DESC;

-- 8. Son 15 gün içinde eklenen kitapları bulun (added_at tarihine göre).

SELECT title, author, added_at
FROM books
WHERE added_at >= DATEADD(day, - 15, GETDATE());

-- 9. En pahalı 5 kitabı price azalan sırada listeleyin (LIMIT 5).

SELECT TOP 5 title, author, price
FROM books
ORDER BY price DESC

-- 10. Stok adedi 30 ile 60 arasında olan kitapları price artan şekilde sıralayın.

SELECT title, author, price, stock
FROM books
WHERE stock BETWEEN 30 AND 60
ORDER BY price;
