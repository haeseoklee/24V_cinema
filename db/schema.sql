CREATE TABLE membership(
    ranking VARCHAR(30) NOT NULL PRIMARY KEY,
    benefit INT NOT NULL
);

CREATE TABLE customer (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    pw VARCHAR(30) NOT NULL,
    point INT NOT NULL DEFAULT 0,
    ph VARCHAR(15) NOT NULL,
    membership_id VARCHAR(30) NOT NULL DEFAULT "NORMAL",
    FOREIGN KEY (membership_id) REFERENCES membership (ranking)
);

CREATE TABLE coupon (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    benefit INT NOT NULL
);

CREATE TABLE customer_coupon (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    coupon_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon (id)
);

CREATE TABLE movie (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    img VARCHAR(100) NOT NULL,
    director VARCHAR(30) NOT NULL,
    genre VARCHAR(30) NOT NULL,
    runtime TIME NOT NULL,
    releaseday DATE NOT NULL,
    agelimit VARCHAR(20) NOT NULL,
    story TEXT NOT NULL
);

CREATE TABLE cinema(
    cinema VARCHAR(30) NOT NULL PRIMARY KEY,
    tel VARCHAR(30) NOT NULL,
    address VARCHAR(60) NOT NULL
);

CREATE TABLE screen(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name INT NOT NULL,
    cinema VARCHAR(30) NOT NULL,
    FOREIGN KEY (cinema) REFERENCES cinema (cinema)
);

CREATE TABLE timetable(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    startdate DATE NOT NULL,
    starttime TIME NOT NULL,
    enddate DATE NOT NULL,
    endtime TIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie (id),
    FOREIGN KEY (screen_id) REFERENCES screen (id)
);

CREATE TABLE reservation(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    timetable_id INT NOT NULL,
    customer_id INT NOT NULL,
    resv_date TIMESTAMP NOT NULL,
    FOREIGN KEY (timetable_id) REFERENCES timetable (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE menu(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    img VARCHAR(100) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE orderlist(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    cinema VARCHAR(30) NOT NULL,
    order_date TIMESTAMP NOT NULL,
    is_able TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (cinema) REFERENCES cinema (cinema)
);

CREATE TABLE menu_order(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount INT NOT NULL,
    menu_id INT NOT NULL,
    orderlist_id INT NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menu (id),
    FOREIGN KEY (orderlist_id) REFERENCES orderlist (id)
);

CREATE TABLE seat(
    timetable_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    is_able TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY (timetable_id) REFERENCES timetable (id),
    PRIMARY KEY (timetable_id, seat_no)
);

CREATE TABLE selected_seat(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    resv_id INT NOT NULL,
    timetable_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (resv_id) REFERENCES reservation (id),
    FOREIGN KEY (timetable_id, seat_no) REFERENCES seat (timetable_id, seat_no)
);

CREATE TABLE ticket_pay(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    origin_pay INT NOT NULL,
    disc_pay INT NOT NULL,
    customer_id INT NOT NULL,
    resv_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (resv_id) REFERENCES reservation (id)
);

CREATE TABLE snack_pay(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    origin_pay INT NOT NULL,
    disc_pay INT NOT NULL,
    customer_id INT NOT NULL,
    orderlist_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (orderlist_id) REFERENCES orderlist (id)
);
