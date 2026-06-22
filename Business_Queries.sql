-- ============================================================
-- Business_Queries.sql
-- Library Information System (LIS) – 10 Required Queries
-- Introduction to Database Systems | BSSE | IIUI-ISB
-- Submitted To: Shakeel Ahmad
-- ============================================================

-- ============================================================
-- QUERY 1 (Multi-Table JOIN – INNER JOIN)
-- Business Question: List all currently borrowed books with
-- the member name, book title, borrow date, and due date.
-- ============================================================
SELECT
    bt.txn_id,
    m.full_name        AS member_name,
    b.title            AS book_title,
    bt.borrow_date,
    bt.due_date,
    bt.status
FROM BorrowTransaction bt
INNER JOIN Member   m  ON bt.member_id = m.member_id
INNER JOIN BookCopy bc ON bt.copy_id   = bc.copy_id
INNER JOIN Book     b  ON bc.book_id   = b.book_id
WHERE bt.status = 'Borrowed'
ORDER BY bt.due_date;

-- ============================================================
-- QUERY 2 (Multi-Table JOIN – LEFT JOIN)
-- Business Question: Show all books and their authors,
-- including books with no author entry (orphan check).
-- ============================================================
SELECT
    b.book_id,
    b.title,
    b.isbn,
    b.publish_year,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    ba.author_role
FROM Book b
LEFT JOIN BookAuthor ba ON b.book_id   = ba.book_id
LEFT JOIN Author     a  ON ba.author_id = a.author_id
ORDER BY b.title;

-- ============================================================
-- QUERY 3 (Multi-Table JOIN – 4 tables)
-- Business Question: Which shelf holds which books, along with
-- their category and publisher?
-- ============================================================
SELECT
    s.shelf_code,
    s.floor_no,
    s.section,
    b.title,
    c.category_name,
    p.name AS publisher
FROM BookCopy bc
INNER JOIN Shelf     s ON bc.shelf_id    = s.shelf_id
INNER JOIN Book      b ON bc.book_id     = b.book_id
INNER JOIN Category  c ON b.category_id  = c.category_id
INNER JOIN Publisher p ON b.publisher_id = p.publisher_id
ORDER BY s.shelf_code, b.title;

-- ============================================================
-- QUERY 4 (Aggregation – COUNT + GROUP BY)
-- Business Question: How many times has each book been
-- borrowed? Rank from most to least borrowed.
-- ============================================================
SELECT
    b.title,
    COUNT(bt.txn_id) AS times_borrowed
FROM Book b
INNER JOIN BookCopy         bc ON b.book_id   = bc.book_id
INNER JOIN BorrowTransaction bt ON bc.copy_id  = bt.copy_id
GROUP BY b.book_id, b.title
ORDER BY times_borrowed DESC;

-- ============================================================
-- QUERY 5 (Aggregation – SUM + GROUP BY + HAVING)
-- Business Question: Which members have total unpaid fines
-- greater than PKR 100? Show their names and total fine.
-- ============================================================
SELECT
    m.full_name       AS member_name,
    m.membership_type,
    SUM(f.fine_amount) AS total_unpaid_fine
FROM Fine f
INNER JOIN BorrowTransaction bt ON f.txn_id    = bt.txn_id
INNER JOIN Member            m  ON bt.member_id = m.member_id
WHERE f.paid_status = 'Unpaid'
GROUP BY m.member_id, m.full_name, m.membership_type
HAVING SUM(f.fine_amount) > 100
ORDER BY total_unpaid_fine DESC;

-- ============================================================
-- QUERY 6 (Aggregation – AVG, MAX, MIN per Category)
-- Business Question: For each book category, what is the
-- average, max, and min publish year of books we hold?
-- ============================================================
SELECT
    c.category_name,
    COUNT(b.book_id)     AS total_books,
    AVG(b.publish_year)  AS avg_publish_year,
    MAX(b.publish_year)  AS newest_book_year,
    MIN(b.publish_year)  AS oldest_book_year
FROM Category c
INNER JOIN Book b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_books DESC;

-- ============================================================
-- QUERY 7 (Subquery – IN operator)
-- Business Question: List all members who have NEVER borrowed
-- a book from the library.
-- ============================================================
SELECT
    m.member_id,
    m.full_name,
    m.membership_type,
    m.status
FROM Member m
WHERE m.member_id NOT IN (
    SELECT DISTINCT bt.member_id
    FROM BorrowTransaction bt
)
ORDER BY m.full_name;

-- ============================================================
-- QUERY 8 (Subquery – EXISTS / correlated)
-- Business Question: Find all books that have at least one
-- copy currently marked as unavailable (checked out).
-- ============================================================
SELECT
    b.book_id,
    b.title,
    b.isbn
FROM Book b
WHERE EXISTS (
    SELECT 1
    FROM BookCopy bc
    WHERE bc.book_id     = b.book_id
      AND bc.is_available = 0
)
ORDER BY b.title;

-- ============================================================
-- QUERY 9 (Subquery – scalar subquery for comparison)
-- Business Question: Show all transactions where the fine
-- amount is above the average fine across all records.
-- ============================================================
SELECT
    f.fine_id,
    m.full_name   AS member_name,
    b.title       AS book_title,
    f.fine_amount,
    f.reason,
    f.paid_status
FROM Fine f
INNER JOIN BorrowTransaction bt ON f.txn_id    = bt.txn_id
INNER JOIN Member            m  ON bt.member_id = m.member_id
INNER JOIN BookCopy          bc ON bt.copy_id   = bc.copy_id
INNER JOIN Book              b  ON bc.book_id   = b.book_id
WHERE f.fine_amount > (
    SELECT AVG(fine_amount) FROM Fine
)
ORDER BY f.fine_amount DESC;

-- ============================================================
-- QUERY 10 (Advanced JOIN + Aggregation)
-- Business Question: Which staff member has processed the
-- most borrow transactions? Show name, role, and count.
-- ============================================================
SELECT
    s.staff_id,
    s.full_name  AS staff_name,
    s.role,
    COUNT(bt.txn_id) AS transactions_handled
FROM Staff s
INNER JOIN BorrowTransaction bt ON s.staff_id = bt.staff_id
GROUP BY s.staff_id, s.full_name, s.role
ORDER BY transactions_handled DESC;


-- ============================================================
-- DATABASE VIEW
-- View: vw_ActiveBorrows
-- Simplifies a complex 4-table join for the circulation desk
-- ============================================================
CREATE OR REPLACE VIEW vw_ActiveBorrows AS
SELECT
    bt.txn_id,
    m.member_id,
    m.full_name        AS member_name,
    m.membership_type,
    b.title            AS book_title,
    b.isbn,
    bc.copy_id,
    s.shelf_code,
    st.full_name       AS issued_by,
    bt.borrow_date,
    bt.due_date,
    bt.status
FROM BorrowTransaction bt
INNER JOIN Member   m  ON bt.member_id = m.member_id
INNER JOIN BookCopy bc ON bt.copy_id   = bc.copy_id
INNER JOIN Book     b  ON bc.book_id   = b.book_id
INNER JOIN Shelf    s  ON bc.shelf_id  = s.shelf_id
INNER JOIN Staff    st ON bt.staff_id  = st.staff_id
WHERE bt.status IN ('Borrowed','Overdue');

-- Use the view:
SELECT * FROM vw_ActiveBorrows ORDER BY due_date;


-- ============================================================
-- STORED PROCEDURE
-- proc_BorrowBook
-- Business Rule: A member can only borrow a book if their
-- account status is 'Active' AND they have no unpaid fines.
-- ============================================================
DELIMITER $$

CREATE PROCEDURE proc_BorrowBook(
    IN  p_member_id  INT,
    IN  p_copy_id    INT,
    IN  p_staff_id   INT,
    IN  p_days       INT,       -- loan duration in days
    OUT p_result     VARCHAR(200)
)
BEGIN
    DECLARE v_status       VARCHAR(10);
    DECLARE v_unpaid_fines DECIMAL(10,2);
    DECLARE v_available    TINYINT(1);
    DECLARE v_new_txn_id   INT;

    -- Check member status
    SELECT status INTO v_status
    FROM Member WHERE member_id = p_member_id;

    IF v_status != 'Active' THEN
        SET p_result = 'ERROR: Member account is not Active.';
    ELSE
        -- Check unpaid fines
        SELECT COALESCE(SUM(f.fine_amount), 0) INTO v_unpaid_fines
        FROM Fine f
        INNER JOIN BorrowTransaction bt ON f.txn_id = bt.txn_id
        WHERE bt.member_id = p_member_id AND f.paid_status = 'Unpaid';

        IF v_unpaid_fines > 0 THEN
            SET p_result = CONCAT('ERROR: Member has unpaid fines of PKR ', v_unpaid_fines, '. Please clear before borrowing.');
        ELSE
            -- Check copy availability
            SELECT is_available INTO v_available
            FROM BookCopy WHERE copy_id = p_copy_id;

            IF v_available = 0 THEN
                SET p_result = 'ERROR: Selected copy is not available.';
            ELSE
                -- All checks passed – create transaction
                SELECT COALESCE(MAX(txn_id),0)+1 INTO v_new_txn_id FROM BorrowTransaction;

                INSERT INTO BorrowTransaction(txn_id, member_id, copy_id, staff_id, borrow_date, due_date, status)
                VALUES (v_new_txn_id, p_member_id, p_copy_id, p_staff_id,
                        CURDATE(), DATE_ADD(CURDATE(), INTERVAL p_days DAY), 'Borrowed');

                UPDATE BookCopy SET is_available = 0 WHERE copy_id = p_copy_id;

                SET p_result = CONCAT('SUCCESS: Transaction #', v_new_txn_id, ' created. Due on ',
                                      DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL p_days DAY),'%d-%b-%Y'));
            END IF;
        END IF;
    END IF;
END$$

DELIMITER ;

-- Test the procedure:
CALL proc_BorrowBook(10, 2, 6, 14, @msg);
SELECT @msg AS result;


-- ============================================================
-- TRIGGER
-- trg_AfterReturn – auto-updates copy availability and
-- auto-generates an overdue fine when a book is returned late
-- ============================================================
DELIMITER $$

CREATE TRIGGER trg_AfterReturn
AFTER UPDATE ON BorrowTransaction
FOR EACH ROW
BEGIN
    DECLARE v_fine_id INT;
    DECLARE v_days_late INT;

    -- Only fire when status changes TO 'Returned'
    IF NEW.status = 'Returned' AND OLD.status != 'Returned' THEN

        -- 1. Mark the copy as available again
        UPDATE BookCopy SET is_available = 1 WHERE copy_id = NEW.copy_id;

        -- 2. If returned after due date, calculate and insert fine
        IF NEW.return_date > NEW.due_date THEN
            SET v_days_late = DATEDIFF(NEW.return_date, NEW.due_date);
            SELECT COALESCE(MAX(fine_id),0)+1 INTO v_fine_id FROM Fine;

            INSERT INTO Fine(fine_id, txn_id, fine_amount, reason, paid_status, issued_date)
            VALUES (v_fine_id, NEW.txn_id, v_days_late * 50.00, 'Overdue', 'Unpaid', CURDATE());
        END IF;

    END IF;
END$$

DELIMITER ;

-- ============================================================
-- END OF QUERIES & ADVANCED OBJECTS SCRIPT
-- ============================================================
