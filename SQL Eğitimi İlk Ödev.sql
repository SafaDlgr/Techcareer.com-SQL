

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
(1, 'Kay�p Zaman�n �zinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
(2, 'Simyac�', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
(3, 'Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
(4, '�nce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
(5, 'K�rl�k', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
(6, 'Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
(7, 'Hayvan �iftli�i', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
(8, '1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
(9, 'Nutuk', 'M. K. Atat�rk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
(10, 'K���k Prens', 'A. de Saint-Exup�ry', '�ocuk', 69.90, 80, 1943, '2025-08-26'),
(11, 'Ba�lang��', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
(12, 'Atomik Al��kanl�klar', 'J. Clear', 'ki�isel geli�im', 129.00, 28, 2018, '2025-09-03'),
(13, 'Zaman�n K�sa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
(14, '�eker Portakal�', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
(15, 'Bir �dam Mahk�munun Son G�n�', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');




-- 1. T�m kitaplar�n title, author, price alanlar�n� fiyat� artan �ekilde s�ralayarak listeleyin.

SELECT title, author, price 
FROM books
ORDER BY price;

-- 2. T�r� 'roman' olan kitaplar� A?Z title s�ras�yla g�sterin.

SELECT title,genre,author FROM books
WHERE genre = 'Roman'
ORDER BY title;

-- 3. Fiyat� 80 ile 120 (dahil) aras�ndaki kitaplar� listeleyin (BETWEEN).

SELECT * FROM books
WHERE price BETWEEN 80 AND 120;

-- 4. Stok adedi 20�den az olan kitaplar� bulun (title, stock).

SELECT title, stock 
FROM books
WHERE stock < 20;

-- 5. title i�inde 'zaman' ge�en kitaplar� LIKE ile filtreleyin (b�y�k/k���k harf durumunu not edin).

SELECT * FROM books
WHERE title LIKE '%zaman%';

-- 6. genre de�eri 'roman' veya 'bilim' olanlar� IN ile listeleyin.

SELECT title, author, genre
FROM books
WHERE genre IN ('Roman','Bilim');

-- 7. published_year de�eri 2000 ve sonras� olan kitaplar�, en yeni y�ldan eskiye do�ru s�ralay�n.

SELECT title, author, published_year
FROM books
WHERE published_year >= 2000
ORDER BY published_year DESC;

-- 8. Son 15 g�n i�inde eklenen kitaplar� bulun (added_at tarihine g�re).

SELECT title, author, added_at
FROM books
WHERE added_at >= DATEADD(day, - 15, GETDATE());

-- 9. En pahal� 5 kitab� price azalan s�rada listeleyin (LIMIT 5).

SELECT TOP 5 title, author, price
FROM books
ORDER BY price DESC

-- 10. Stok adedi 30 ile 60 aras�nda olan kitaplar� price artan �ekilde s�ralay�n.

SELECT title, author, price, stock
FROM books
WHERE stock BETWEEN 30 AND 60
ORDER BY price;