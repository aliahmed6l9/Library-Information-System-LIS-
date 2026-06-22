-- ============================================================
-- Schema_Design.sql
-- Library Information System (LIS)
-- Introduction to Database Systems | BSSE | IIUI-ISB
-- Submitted To: Shakeel Ahmad
-- ============================================================

-- ============================================================
-- SECTION 0: DROP TABLES (for clean, repeatable execution)
-- ============================================================
DROP TABLE IF EXISTS Fine;
DROP TABLE IF EXISTS BorrowTransaction;
DROP TABLE IF EXISTS BookCopy;
DROP TABLE IF EXISTS BookAuthor;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Shelf;

-- ============================================================
-- SECTION 1: TABLE CREATION WITH CONSTRAINTS
-- ============================================================

-- Table: Staff
-- Stores library staff who manage borrowing transactions
CREATE TABLE Staff (
    staff_id      INT            NOT NULL,
    full_name     VARCHAR(100)   NOT NULL,
    email         VARCHAR(100)   NOT NULL,
    phone         VARCHAR(20),
    role          VARCHAR(50)    NOT NULL,
    hire_date     DATE           NOT NULL,
    salary        DECIMAL(10,2)  NOT NULL CHECK (salary > 0),
    CONSTRAINT pk_staff      PRIMARY KEY (staff_id),
    CONSTRAINT uq_staff_email UNIQUE (email)
);

-- Table: Member
-- Stores registered library members
CREATE TABLE Member (
    member_id     INT            NOT NULL,
    full_name     VARCHAR(100)   NOT NULL,
    email         VARCHAR(100)   NOT NULL,
    phone         VARCHAR(20),
    address       VARCHAR(200),
    join_date     DATE           NOT NULL,
    membership_type VARCHAR(20)  NOT NULL CHECK (membership_type IN ('Student','Faculty','Public')),
    status        VARCHAR(10)    NOT NULL DEFAULT 'Active' CHECK (status IN ('Active','Suspended','Expired')),
    CONSTRAINT pk_member      PRIMARY KEY (member_id),
    CONSTRAINT uq_member_email UNIQUE (email)
);

-- Table: Publisher
-- Stores book publisher details
CREATE TABLE Publisher (
    publisher_id  INT            NOT NULL,
    name          VARCHAR(150)   NOT NULL,
    city          VARCHAR(100),
    country       VARCHAR(100),
    phone         VARCHAR(20),
    CONSTRAINT pk_publisher   PRIMARY KEY (publisher_id)
);

-- Table: Category
-- Stores book genre / subject categories
CREATE TABLE Category (
    category_id   INT            NOT NULL,
    category_name VARCHAR(100)   NOT NULL,
    description   VARCHAR(255),
    CONSTRAINT pk_category    PRIMARY KEY (category_id),
    CONSTRAINT uq_cat_name    UNIQUE (category_name)
);

-- Table: Shelf
-- Represents physical shelf locations inside the library
CREATE TABLE Shelf (
    shelf_id      INT            NOT NULL,
    shelf_code    VARCHAR(20)    NOT NULL,
    floor_no      INT            NOT NULL CHECK (floor_no >= 0),
    section       VARCHAR(50),
    CONSTRAINT pk_shelf       PRIMARY KEY (shelf_id),
    CONSTRAINT uq_shelf_code  UNIQUE (shelf_code)
);

-- Table: Author
-- Stores author information
CREATE TABLE Author (
    author_id     INT            NOT NULL,
    first_name    VARCHAR(80)    NOT NULL,
    last_name     VARCHAR(80)    NOT NULL,
    nationality   VARCHAR(80),
    birth_year    INT            CHECK (birth_year > 1500),
    CONSTRAINT pk_author      PRIMARY KEY (author_id)
);

-- Table: Book
-- Stores master book records (one logical title)
CREATE TABLE Book (
    book_id       INT            NOT NULL,
    title         VARCHAR(200)   NOT NULL,
    isbn          VARCHAR(20)    NOT NULL,
    edition       INT            DEFAULT 1 CHECK (edition > 0),
    publish_year  INT            NOT NULL CHECK (publish_year > 1800),
    language      VARCHAR(50)    NOT NULL DEFAULT 'English',
    total_pages   INT            CHECK (total_pages > 0),
    category_id   INT            NOT NULL,
    publisher_id  INT            NOT NULL,
    CONSTRAINT pk_book        PRIMARY KEY (book_id),
    CONSTRAINT uq_book_isbn   UNIQUE (isbn),
    CONSTRAINT fk_book_cat    FOREIGN KEY (category_id)  REFERENCES Category(category_id)  ON DELETE RESTRICT  ON UPDATE CASCADE,
    CONSTRAINT fk_book_pub    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id) ON DELETE RESTRICT  ON UPDATE CASCADE
);

-- Table: BookAuthor
-- Resolves M:N relationship between Book and Author
CREATE TABLE BookAuthor (
    book_id       INT            NOT NULL,
    author_id     INT            NOT NULL,
    author_role   VARCHAR(50)    DEFAULT 'Primary',
    CONSTRAINT pk_bookauthor  PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book     FOREIGN KEY (book_id)   REFERENCES Book(book_id)     ON DELETE CASCADE  ON UPDATE CASCADE,
    CONSTRAINT fk_ba_author   FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Table: BookCopy
-- Each physical copy of a book on a shelf
CREATE TABLE BookCopy (
    copy_id       INT            NOT NULL,
    book_id       INT            NOT NULL,
    shelf_id      INT            NOT NULL,
    condition     VARCHAR(20)    NOT NULL DEFAULT 'Good' CHECK (condition IN ('New','Good','Fair','Poor')),
    is_available  TINYINT(1)     NOT NULL DEFAULT 1 CHECK (is_available IN (0,1)),
    acquired_date DATE           NOT NULL,
    CONSTRAINT pk_copy        PRIMARY KEY (copy_id),
    CONSTRAINT fk_copy_book   FOREIGN KEY (book_id)  REFERENCES Book(book_id)  ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_copy_shelf  FOREIGN KEY (shelf_id) REFERENCES Shelf(shelf_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Table: BorrowTransaction
-- Records every borrow and return event
CREATE TABLE BorrowTransaction (
    txn_id        INT            NOT NULL,
    member_id     INT            NOT NULL,
    copy_id       INT            NOT NULL,
    staff_id      INT            NOT NULL,
    borrow_date   DATE           NOT NULL,
    due_date      DATE           NOT NULL,
    return_date   DATE,
    status        VARCHAR(20)    NOT NULL DEFAULT 'Borrowed' CHECK (status IN ('Borrowed','Returned','Overdue')),
    CONSTRAINT pk_txn         PRIMARY KEY (txn_id),
    CONSTRAINT fk_txn_member  FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_txn_copy    FOREIGN KEY (copy_id)   REFERENCES BookCopy(copy_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_txn_staff   FOREIGN KEY (staff_id)  REFERENCES Staff(staff_id)   ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_dates      CHECK (due_date > borrow_date)
);

-- Table: Fine
-- Tracks fines for overdue or damaged books
CREATE TABLE Fine (
    fine_id       INT            NOT NULL,
    txn_id        INT            NOT NULL,
    fine_amount   DECIMAL(8,2)   NOT NULL CHECK (fine_amount >= 0),
    reason        VARCHAR(50)    NOT NULL CHECK (reason IN ('Overdue','Damaged','Lost')),
    paid_status   VARCHAR(10)    NOT NULL DEFAULT 'Unpaid' CHECK (paid_status IN ('Paid','Unpaid')),
    issued_date   DATE           NOT NULL,
    paid_date     DATE,
    CONSTRAINT pk_fine        PRIMARY KEY (fine_id),
    CONSTRAINT fk_fine_txn    FOREIGN KEY (txn_id) REFERENCES BorrowTransaction(txn_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================================
-- END OF DDL SCRIPT
-- ============================================================
