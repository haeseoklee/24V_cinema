CREATE TABLE customer (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    pw VARCHAR(30) NOT NULL,
    point INT NOT NULL DEFAULT 0,
    ph INT NOT NULL
);

CREATE TABLE coupon (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    benefit INT NOT NULL,
    period INT NOT NULL
);

CREATE TABLE customer_coupon (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    coupon_id INT NOT NULL,
    registerday DATE,
    deadline DATE,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon (id)
);

CREATE TABLE movie (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    img VARCHAR(100) NOT NULL
);

CREATE TABLE screen(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name INT NOT NULL,
    type VARCHAR(45) NOT NULL,
    cinema VARCHAR(45) NOT NULL
);

CREATE TABLE timetable(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    starttime DATETIME NOT NULL,
    endtime DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie (id),
    FOREIGN KEY (screen_id) REFERENCES screen (id)
);

CREATE TABLE reservation(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    timetable_id INT NOT NULL,
    customer_id INT NOT NULL,
    resv_date DATETIME NOT NULL,
    FOREIGN KEY (timetable_id) REFERENCES timetable (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE menu(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE snackbar(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cinema VARCHAR(10) NOT NULL
);

CREATE TABLE orderlist(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    snackbar_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (snackbar_id) REFERENCES snackbar (id)
);

CREATE TABLE menu_order(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount INT NOT NULL,
    menu_id INT NOT NULL,
    orderlist_id INT NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menu (id),
    FOREIGN KEY (orderlist_id) REFERENCES orderlist (id)
);