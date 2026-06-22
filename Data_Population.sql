-- ============================================================
-- Data_Population.sql
-- Library Information System (LIS) – Sample Data
-- Introduction to Database Systems | BSSE | IIUI-ISB
-- Submitted To: Shakeel Ahmad
-- ============================================================
-- NOTE: Insert order respects FK constraints
--       (parent tables first, child tables after)
-- ============================================================

-- -----------------------------------------------
-- 1. Staff  (no FK dependencies)
-- -----------------------------------------------
INSERT INTO Staff VALUES (1,  'Ahmed Raza',      'ahmed.raza@lis.pk',     '0300-1234567', 'Head Librarian', '2018-03-15', 85000.00);
INSERT INTO Staff VALUES (2,  'Fatima Noor',     'fatima.noor@lis.pk',    '0301-2345678', 'Assistant Librarian', '2019-06-01', 60000.00);
INSERT INTO Staff VALUES (3,  'Usman Tariq',     'usman.tariq@lis.pk',    '0302-3456789', 'Cataloging Officer', '2020-01-10', 55000.00);
INSERT INTO Staff VALUES (4,  'Sara Malik',      'sara.malik@lis.pk',     '0303-4567890', 'Reference Librarian', '2021-08-20', 58000.00);
INSERT INTO Staff VALUES (5,  'Bilal Hassan',    'bilal.hassan@lis.pk',   '0304-5678901', 'IT Support', '2022-02-14', 52000.00);
INSERT INTO Staff VALUES (6,  'Zara Khan',       'zara.khan@lis.pk',      '0305-6789012', 'Circulation Clerk', '2021-11-01', 45000.00);
INSERT INTO Staff VALUES (7,  'Hamza Ali',       'hamza.ali@lis.pk',      '0306-7890123', 'Circulation Clerk', '2022-05-17', 45000.00);
INSERT INTO Staff VALUES (8,  'Amina Qureshi',   'amina.qureshi@lis.pk',  '0307-8901234', 'Acquisition Officer', '2020-09-03', 62000.00);
INSERT INTO Staff VALUES (9,  'Rehan Siddiqui',  'rehan.siddiqui@lis.pk', '0308-9012345', 'Archive Specialist', '2019-12-22', 64000.00);
INSERT INTO Staff VALUES (10, 'Nadia Farooq',    'nadia.farooq@lis.pk',   '0309-0123456', 'Cataloging Officer', '2023-03-05', 54000.00);

-- -----------------------------------------------
-- 2. Member  (no FK dependencies)
-- -----------------------------------------------
INSERT INTO Member VALUES (1,  'Ali Imran',       'ali.imran@student.iiui.edu.pk',   '0320-1111111', 'H-10, Islamabad',  '2023-09-01', 'Student',  'Active');
INSERT INTO Member VALUES (2,  'Hina Baig',       'hina.baig@student.iiui.edu.pk',   '0321-2222222', 'F-7/2, Islamabad', '2023-09-01', 'Student',  'Active');
INSERT INTO Member VALUES (3,  'Dr. Kamran Shah', 'kamran.shah@iiui.edu.pk',         '0322-3333333', 'G-9, Islamabad',   '2022-01-15', 'Faculty',  'Active');
INSERT INTO Member VALUES (4,  'Sana Javed',      'sana.javed@gmail.com',            '0323-4444444', 'I-8, Islamabad',   '2021-06-10', 'Public',   'Active');
INSERT INTO Member VALUES (5,  'Tariq Mehmood',   'tariq.m@student.iiui.edu.pk',     '0324-5555555', 'E-11, Islamabad',  '2024-01-10', 'Student',  'Active');
INSERT INTO Member VALUES (6,  'Mariam Akhtar',   'mariam.akhtar@iiui.edu.pk',       '0325-6666666', 'F-10, Islamabad',  '2020-08-20', 'Faculty',  'Active');
INSERT INTO Member VALUES (7,  'Faisal Nawaz',    'faisal.nawaz@yahoo.com',          '0326-7777777', 'G-13, Islamabad',  '2022-03-05', 'Public',   'Suspended');
INSERT INTO Member VALUES (8,  'Bushra Aziz',     'bushra.aziz@student.iiui.edu.pk', '0327-8888888', 'H-8, Islamabad',   '2023-09-01', 'Student',  'Active');
INSERT INTO Member VALUES (9,  'Khalid Mehmood',  'khalid.m@iiui.edu.pk',            '0328-9999999', 'D-12, Islamabad',  '2019-05-01', 'Faculty',  'Active');
INSERT INTO Member VALUES (10, 'Rabia Saeed',     'rabia.saeed@student.iiui.edu.pk', '0329-0000000', 'B-17, Islamabad',  '2024-02-15', 'Student',  'Active');
INSERT INTO Member VALUES (11, 'Zain ul Abideen', 'zain.ua@student.iiui.edu.pk',     '0330-1212121', 'I-9, Islamabad',   '2023-09-01', 'Student',  'Active');
INSERT INTO Member VALUES (12, 'Nimra Waheed',    'nimra.waheed@gmail.com',          '0331-3434343', 'F-8, Islamabad',   '2021-11-30', 'Public',   'Active');

-- -----------------------------------------------
-- 3. Publisher  (no FK dependencies)
-- -----------------------------------------------
INSERT INTO Publisher VALUES (1,  'Oxford University Press',   'Oxford',       'UK',       '+44-1865-353535');
INSERT INTO Publisher VALUES (2,  'Pearson Education',         'London',       'UK',       '+44-207-0100777');
INSERT INTO Publisher VALUES (3,  'McGraw-Hill Education',     'New York',     'USA',      '+1-212-9046789');
INSERT INTO Publisher VALUES (4,  'Addison-Wesley',            'Boston',       'USA',      '+1-617-8482500');
INSERT INTO Publisher VALUES (5,  'Springer',                  'Berlin',       'Germany',  '+49-6221-3450');
INSERT INTO Publisher VALUES (6,  'Wiley & Sons',              'Hoboken',      'USA',      '+1-201-7486000');
INSERT INTO Publisher VALUES (7,  'Cambridge University Press','Cambridge',    'UK',       '+44-1223-312393');
INSERT INTO Publisher VALUES (8,  'Urdu Science Board',        'Lahore',       'Pakistan', '+92-42-9920027');
INSERT INTO Publisher VALUES (9,  'National Book Foundation',  'Islamabad',    'Pakistan', '+92-51-9257277');
INSERT INTO Publisher VALUES (10, 'Harper Collins',            'New York',     'USA',      '+1-212-2070700');

-- -----------------------------------------------
-- 4. Category  (no FK dependencies)
-- -----------------------------------------------
INSERT INTO Category VALUES (1,  'Computer Science',  'Books related to programming, databases, algorithms');
INSERT INTO Category VALUES (2,  'Mathematics',       'Pure and applied mathematics');
INSERT INTO Category VALUES (3,  'Physics',           'Classical and modern physics');
INSERT INTO Category VALUES (4,  'Literature',        'Fiction, poetry, and drama');
INSERT INTO Category VALUES (5,  'History',           'World and regional history');
INSERT INTO Category VALUES (6,  'Islamic Studies',   'Quran, Hadith, and Islamic jurisprudence');
INSERT INTO Category VALUES (7,  'Engineering',       'Civil, mechanical, electrical engineering');
INSERT INTO Category VALUES (8,  'Economics',         'Micro and macroeconomics');
INSERT INTO Category VALUES (9,  'Psychology',        'Behavioral and cognitive psychology');
INSERT INTO Category VALUES (10, 'Biology',           'Life sciences and genetics');

-- -----------------------------------------------
-- 5. Shelf  (no FK dependencies)
-- -----------------------------------------------
INSERT INTO Shelf VALUES (1,  'A-01', 1, 'Computer Science Wing');
INSERT INTO Shelf VALUES (2,  'A-02', 1, 'Computer Science Wing');
INSERT INTO Shelf VALUES (3,  'B-01', 1, 'Science Wing');
INSERT INTO Shelf VALUES (4,  'B-02', 1, 'Science Wing');
INSERT INTO Shelf VALUES (5,  'C-01', 2, 'Humanities Wing');
INSERT INTO Shelf VALUES (6,  'C-02', 2, 'Humanities Wing');
INSERT INTO Shelf VALUES (7,  'D-01', 2, 'Islamic Studies Wing');
INSERT INTO Shelf VALUES (8,  'D-02', 2, 'Islamic Studies Wing');
INSERT INTO Shelf VALUES (9,  'E-01', 3, 'Reference Section');
INSERT INTO Shelf VALUES (10, 'E-02', 3, 'Reference Section');

-- -----------------------------------------------
-- 6. Author  (no FK dependencies)
-- -----------------------------------------------
INSERT INTO Author VALUES (1,  'Abraham',  'Silberschatz', 'American',   1945);
INSERT INTO Author VALUES (2,  'Ramez',    'Elmasri',      'American',   1950);
INSERT INTO Author VALUES (3,  'Thomas',   'Cormen',       'American',   1956);
INSERT INTO Author VALUES (4,  'James',    'Stewart',      'Canadian',   1941);
INSERT INTO Author VALUES (5,  'David',    'Halliday',     'American',   1916);
INSERT INTO Author VALUES (6,  'Jane',     'Austen',       'British',    1775);
INSERT INTO Author VALUES (7,  'Yuval',    'Harari',       'Israeli',    1976);
INSERT INTO Author VALUES (8,  'William',  'Stallings',    'American',   1948);
INSERT INTO Author VALUES (9,  'N.',       'Gregory Mankiw','American',  1958);
INSERT INTO Author VALUES (10, 'Daniel',   'Kahneman',     'Israeli',    1934);
INSERT INTO Author VALUES (11, 'Shamsi',   'Rao',          'Pakistani',  1960);
INSERT INTO Author VALUES (12, 'Robert',   'Sedgewick',    'American',   1946);

-- -----------------------------------------------
-- 7. Book  (depends on Category, Publisher)
-- -----------------------------------------------
INSERT INTO Book VALUES (1,  'Database System Concepts',            '978-0-07-352332-3', 7, 2020, 'English', 1376, 1, 3);
INSERT INTO Book VALUES (2,  'Fundamentals of Database Systems',    '978-0-13-397077-7', 7, 2015, 'English', 1280, 1, 2);
INSERT INTO Book VALUES (3,  'Introduction to Algorithms',          '978-0-26-204630-5', 4, 2022, 'English', 1312, 1, 3);
INSERT INTO Book VALUES (4,  'Calculus: Early Transcendentals',     '978-1-28-505709-5', 8, 2016, 'English',  960, 2, 3);
INSERT INTO Book VALUES (5,  'Fundamentals of Physics',             '978-1-11-823071-8',10, 2018, 'English', 1248, 3, 6);
INSERT INTO Book VALUES (6,  'Pride and Prejudice',                 '978-0-14-143951-8', 1, 1813, 'English',  432, 4, 1);
INSERT INTO Book VALUES (7,  'Sapiens: A Brief History of Humankind','978-0-06-231609-7',1, 2011, 'English', 443,  5, 10);
INSERT INTO Book VALUES (8,  'Operating System Concepts',           '978-1-11-856322-3',10, 2018, 'English', 976,  1, 6);
INSERT INTO Book VALUES (9,  'Principles of Economics',             '978-0-35-766651-5', 8, 2018, 'English', 880,  8, 2);
INSERT INTO Book VALUES (10, 'Thinking, Fast and Slow',             '978-0-37-453355-7', 1, 2011, 'English', 499,  9, 10);
INSERT INTO Book VALUES (11, 'Algorithms (4th Edition)',            '978-0-32-157351-3', 4, 2011, 'English', 976,  1, 2);
INSERT INTO Book VALUES (12, 'Urdu Adab ki Mukhtasar Tarikh',       '978-9-69-00000-1-2',1, 2010, 'Urdu',   312,  4, 8);
INSERT INTO Book VALUES (13, 'Computer Networks',                   '978-0-13-212695-3', 5, 2011, 'English', 960,  1, 2);

-- -----------------------------------------------
-- 8. BookAuthor  (depends on Book, Author)
-- -----------------------------------------------
INSERT INTO BookAuthor VALUES (1,  1, 'Primary');
INSERT INTO BookAuthor VALUES (2,  2, 'Primary');
INSERT INTO BookAuthor VALUES (3,  3, 'Primary');
INSERT INTO BookAuthor VALUES (4,  4, 'Primary');
INSERT INTO BookAuthor VALUES (5,  5, 'Primary');
INSERT INTO BookAuthor VALUES (6,  6, 'Primary');
INSERT INTO BookAuthor VALUES (7,  7, 'Primary');
INSERT INTO BookAuthor VALUES (8,  8, 'Primary');
INSERT INTO BookAuthor VALUES (9,  9, 'Primary');
INSERT INTO BookAuthor VALUES (10,10, 'Primary');
INSERT INTO BookAuthor VALUES (11,12, 'Primary');
INSERT INTO BookAuthor VALUES (12,11, 'Primary');
INSERT INTO BookAuthor VALUES (13, 8, 'Primary');
-- Book 3 has a co-author
INSERT INTO BookAuthor VALUES (3,  12, 'Co-Author');

-- -----------------------------------------------
-- 9. BookCopy  (depends on Book, Shelf)
-- -----------------------------------------------
INSERT INTO BookCopy VALUES (1,  1,  1, 'Good',  1, '2021-01-10');
INSERT INTO BookCopy VALUES (2,  1,  1, 'Good',  1, '2021-01-10');
INSERT INTO BookCopy VALUES (3,  2,  1, 'Fair',  1, '2020-06-15');
INSERT INTO BookCopy VALUES (4,  3,  2, 'New',   1, '2023-03-01');
INSERT INTO BookCopy VALUES (5,  3,  2, 'Good',  1, '2022-08-20');
INSERT INTO BookCopy VALUES (6,  4,  3, 'Good',  1, '2021-09-12');
INSERT INTO BookCopy VALUES (7,  5,  3, 'Fair',  1, '2020-04-05');
INSERT INTO BookCopy VALUES (8,  6,  5, 'Good',  1, '2019-11-20');
INSERT INTO BookCopy VALUES (9,  7,  5, 'New',   1, '2024-01-15');
INSERT INTO BookCopy VALUES (10, 8,  2, 'Good',  1, '2021-07-07');
INSERT INTO BookCopy VALUES (11, 8,  2, 'Poor',  1, '2018-05-30');
INSERT INTO BookCopy VALUES (12, 9,  9, 'Good',  1, '2022-02-28');
INSERT INTO BookCopy VALUES (13,10,  6, 'New',   1, '2023-06-10');
INSERT INTO BookCopy VALUES (14,11,  1, 'Good',  1, '2022-11-11');
INSERT INTO BookCopy VALUES (15,12,  7, 'Fair',  1, '2020-08-01');
INSERT INTO BookCopy VALUES (16,13,  2, 'Good',  1, '2021-03-18');
INSERT INTO BookCopy VALUES (17, 1,  1, 'New',   1, '2024-04-01');
INSERT INTO BookCopy VALUES (18, 2,  1, 'Good',  1, '2023-09-09');
INSERT INTO BookCopy VALUES (19, 4,  3, 'Good',  1, '2022-01-20');
INSERT INTO BookCopy VALUES (20, 9,  9, 'Fair',  1, '2021-12-01');

-- -----------------------------------------------
-- 10. BorrowTransaction  (depends on Member, BookCopy, Staff)
--     Mark some copies unavailable to match
-- -----------------------------------------------
-- First update availability for borrowed copies
UPDATE BookCopy SET is_available = 0 WHERE copy_id IN (1, 4, 7, 10, 13, 15);

INSERT INTO BorrowTransaction VALUES (1,  1,  1,  6, '2025-01-10', '2025-01-24', NULL,         'Borrowed');
INSERT INTO BorrowTransaction VALUES (2,  2,  4,  7, '2025-01-12', '2025-01-26', NULL,         'Borrowed');
INSERT INTO BorrowTransaction VALUES (3,  3,  7,  2, '2025-01-05', '2025-01-19', '2025-01-18', 'Returned');
INSERT INTO BorrowTransaction VALUES (4,  4,  10, 6, '2025-01-15', '2025-01-29', '2025-01-30', 'Returned');
INSERT INTO BorrowTransaction VALUES (5,  5,  13, 7, '2025-02-01', '2025-02-15', NULL,         'Borrowed');
INSERT INTO BorrowTransaction VALUES (6,  6,  15, 2, '2025-02-03', '2025-02-17', NULL,         'Borrowed');
INSERT INTO BorrowTransaction VALUES (7,  1,  3,  6, '2024-12-01', '2024-12-15', '2024-12-14', 'Returned');
INSERT INTO BorrowTransaction VALUES (8,  8,  6,  7, '2024-12-10', '2024-12-24', '2024-12-28', 'Returned');
INSERT INTO BorrowTransaction VALUES (9,  9,  8,  2, '2025-01-20', '2025-02-03', NULL,         'Overdue');
INSERT INTO BorrowTransaction VALUES (10, 10, 12, 6, '2025-02-05', '2025-02-19', '2025-02-19', 'Returned');
INSERT INTO BorrowTransaction VALUES (11, 11, 16, 7, '2025-02-08', '2025-02-22', '2025-02-20', 'Returned');
INSERT INTO BorrowTransaction VALUES (12, 12, 18, 2, '2025-02-10', '2025-02-24', NULL,         'Borrowed');
INSERT INTO BorrowTransaction VALUES (13, 3,  5,  6, '2025-03-01', '2025-03-15', '2025-03-14', 'Returned');
INSERT INTO BorrowTransaction VALUES (14, 5,  9,  7, '2025-03-05', '2025-03-19', '2025-03-22', 'Returned');
INSERT INTO BorrowTransaction VALUES (15, 7,  11, 2, '2024-11-01', '2024-11-15', '2024-11-20', 'Returned');

-- -----------------------------------------------
-- 11. Fine  (depends on BorrowTransaction)
-- -----------------------------------------------
INSERT INTO Fine VALUES (1, 4,  50.00, 'Overdue', 'Paid',   '2025-01-31', '2025-02-05');
INSERT INTO Fine VALUES (2, 8, 200.00, 'Overdue', 'Paid',   '2024-12-29', '2025-01-10');
INSERT INTO Fine VALUES (3, 8, 150.00, 'Damaged', 'Unpaid', '2024-12-29', NULL);
INSERT INTO Fine VALUES (4, 9, 300.00, 'Overdue', 'Unpaid', '2025-02-04', NULL);
INSERT INTO Fine VALUES (5,14, 150.00, 'Overdue', 'Unpaid', '2025-03-23', NULL);
INSERT INTO Fine VALUES (6,15, 250.00, 'Overdue', 'Paid',   '2024-11-21', '2024-12-01');
INSERT INTO Fine VALUES (7,15,  80.00, 'Damaged', 'Paid',   '2024-11-21', '2024-12-01');

-- ============================================================
-- END OF DML SCRIPT
-- ============================================================
