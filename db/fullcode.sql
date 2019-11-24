CREATE TABLE membership(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rank VARCHAR(30) NOT NULL
);

INSERT INTO membership(rank) VALUES ("NORMAL");
INSERT INTO membership(rank) VALUES ("FAMILY");
INSERT INTO membership(rank) VALUES ("SILVER");
INSERT INTO membership(rank) VALUES ("GOLD");
INSERT INTO membership(rank) VALUES ("PLATINUM");
INSERT INTO membership(rank) VALUES ("VIP");

CREATE TABLE customer (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    pw VARCHAR(30) NOT NULL,
    point INT NOT NULL DEFAULT 0,
    ph INT NOT NULL,
    membership_id INT NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership (id)
);
INSERT INTO customer (id, name, email, pw, ph, membership_id) 
VALUES (NULL, '이해석','interpret96@gmail.com', '1234', '01079794949', 3);
INSERT INTO customer (id, name, email, pw, ph, membership_id) 
VALUES (NULL, '이해석','haeseoklee.dev@gmail.com', '2345', '01079794949', 4);
INSERT INTO customer (id, name, email, pw, ph, membership_id) 
VALUES (NULL, '정희재','jhj967878@naver.com', '123123', '01064398402', 6);

CREATE TABLE coupon (
    id INT NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    benefit INT NOT NULL,
    period INT NOT NULL
);

INSERT INTO coupon (id,name,benefit,period)
VALUES (null,'수험생할인',1000,10);
INSERT INTO coupon (id,name,benefit,period)
VALUES (null,'신규회원할인',1000,7);

CREATE TABLE customer_coupon (
    id INT NOT NULL auto_increment PRIMARY KEY,
    customer_id INT NOT NULL,
    coupon_id INT NOT NULL,
    registerday DATE,
    deadline DATE,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon (id)
);

INSERT INTO customer_coupon (id,customer_id,coupon_id,registerday,deadline)
VALUES (null,1,1,'2019-11-15','2019-11-25');
INSERT INTO customer_coupon (id,customer_id,coupon_id,registerday,deadline)
VALUES (null,1,2,'2019-11-15','2019-11-22');
INSERT INTO customer_coupon (id,customer_id,coupon_id,registerday,deadline)
VALUES (null,2,2,'2019-11-15','2019-11-22');

CREATE TABLE movie (
    id INT NOT NULL auto_increment PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    img VARCHAR(100) NOT NULL
);

INSERT INTO `movie` (`id`, `title`, `img`) VALUES (NULL, '터미네이터: 다크 페이트', '/movies/images/terminator.jpg');
INSERT INTO `movie` (`id`, `title`, `img`) VALUES (NULL, '신의 한 수: 귀수편', '/movies/images/godshansu.jpg');
INSERT INTO `movie` (`id`, `title`, `img`) VALUES (NULL, '조커', '/movies/images/joker.jpg');

CREATE TABLE screen(
    id INT NOT NULL auto_increment PRIMARY KEY,
    name INT NOT NULL,
    type VARCHAR(45) NOT NULL,
    cinema VARCHAR(45) NOT NULL
);

INSERT INTO screen (name,type,cinema)
VALUES (1,'4DX','SU');
INSERT INTO screen (name,type,cinema)
VALUES (2,'IMAX','SU');
INSERT INTO screen (name,type,cinema)
VALUES (3,'스크린X','SU');
INSERT INTO screen (name,type,cinema)
VALUES (4,'3D','SU');
INSERT INTO screen (name,type,cinema)
VALUES (5,'2D','SU');
INSERT INTO screen (name,type,cinema)
VALUES (1,'4DX','IC');
INSERT INTO screen (name,type,cinema)
VALUES (2,'IMAX','IC');
INSERT INTO screen (name,type,cinema)
VALUES (3,'스크린X','IC');
INSERT INTO screen (name,type,cinema)
VALUES (4,'3D','IC');
INSERT INTO screen (name,type,cinema)
VALUES (5,'2D','IC');

CREATE TABLE timetable(
    id INT NOT NULL auto_increment PRIMARY KEY,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    starttime DATETIME NOT NULL,
    endtime DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie (id),
    FOREIGN KEY (screen_id) REFERENCES screen (id)
);

INSERT INTO timetable(movie_id, screen_id, starttime, endtime)
VALUES (1, 2, '2019-11-16 08:00', '2019-11-16 10:08');
INSERT INTO timetable(movie_id, screen_id, starttime, endtime)
VALUES (1, 3, '2019-11-16 09:00', '2019-11-16 11:08');
INSERT INTO timetable(movie_id, screen_id, starttime, endtime)
VALUES (1, 5, '2019-11-16 10:00', '2019-11-16 12:08');

INSERT INTO timetable(movie_id, screen_id, starttime, endtime)
VALUES (1, 7, '2019-11-16 08:10', '2019-11-16 10:08');
INSERT INTO timetable(movie_id, screen_id, starttime, endtime)
VALUES (1, 8, '2019-11-16 09:10', '2019-11-16 11:18');
INSERT INTO timetable(movie_id, screen_id, starttime, endtime)
VALUES (1, 10, '2019-11-16 10:10', '2019-11-16 12:18');


CREATE TABLE reservation(
    id INT NOT NULL auto_increment PRIMARY KEY,
    timetable_id INT NOT NULL,
    customer_id INT NOT NULL,
    resv_date DATETIME NOT NULL,
    FOREIGN KEY (timetable_id) REFERENCES timetable (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);

INSERT INTO reservation(timetable_id, customer_id, resv_date)
VALUES (1,1,"2019-11-15 18:32");

INSERT INTO reservation(timetable_id, customer_id, resv_date)
VALUES (3,2,"2019-11-15 19:20");

INSERT INTO reservation(timetable_id, customer_id, resv_date)
VALUES (5,3,"2019-11-15 20:47");

CREATE TABLE menu(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    price INT NOT NULL
);
INSERT INTO menu(name, price) VALUES ("오리지널 팝콘", 5000);
INSERT INTO menu(name, price) VALUES ("카라멜 팝콘", 5500);
INSERT INTO menu(name, price) VALUES ("어니언 팝콘", 5500);
INSERT INTO menu(name, price) VALUES ("치즈 팝콘", 5500);
INSERT INTO menu(name, price) VALUES ("탄산음료", 2000);
INSERT INTO menu(name, price) VALUES ("에이드음료", 2500);
INSERT INTO menu(name, price) VALUES ("나쵸치즈", 3000);
INSERT INTO menu(name, price) VALUES ("오징어버터구이", 3000);

CREATE TABLE snackbar(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cinema VARCHAR(10) NOT NULL
);

INSERT INTO snackbar(cinema) VALUES ('SE');
INSERT INTO snackbar(cinema) VALUES ('IC');
INSERT INTO snackbar(cinema) VALUES ('DJ');
INSERT INTO snackbar(cinema) VALUES ('DG');
INSERT INTO snackbar(cinema) VALUES ('US');
INSERT INTO snackbar(cinema) VALUES ('GJ');
INSERT INTO snackbar(cinema) VALUES ('BS');

CREATE TABLE orderlist(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    snackbar_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (snackbar_id) REFERENCES snackbar (id)
);

INSERT INTO orderlist(customer_id, snackbar_id) VALUES (1,1);
INSERT INTO orderlist(customer_id, snackbar_id) VALUES (2,1);
INSERT INTO orderlist(customer_id, snackbar_id) VALUES (3,2);

CREATE TABLE menu_order(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount INT NOT NULL,
    menu_id INT NOT NULL,
    orderlist_id INT NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menu (id),
    FOREIGN KEY (orderlist_id) REFERENCES orderlist (id)
);

INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(2, 1, 1);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(2, 5, 1);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(1, 2, 2);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(2, 6, 2);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(1, 8, 3);

CREATE TABLE seat(
    timetable_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    is_able TINYINT NOT NULL,
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

INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(1, 1, 'A01');
INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(1, 1, 'A02');

INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(2, 3, 'A01');
INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(2, 3, 'A02');

INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(3, 5, 'A01');
INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(3, 5, 'A02');
INSERT INTO selected_seat(resv_id, timetable_id, seat_no) 
VALUES(3, 5, 'A03');

-- 좌석 선태에 의한 is_able 값 변경
UPDATE seat SET is_able=0 WHERE screen_id=2 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE screen_id=2 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE screen_id=5 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE screen_id=5 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE screen_id=8 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE screen_id=8 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE screen_id=8 AND seat_no='A03';

CREATE TABLE pay(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    origin_pay INT NOT NULL,
    disc_pay INT NOT NULL,
    customer_id INT NOT NULL,
    orderlist_id INT NOT NULL,
    resv_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (orderlist_id) REFERENCES orderlist (id),
    FOREIGN KEY (resv_id) REFERENCES reservation (id)
);

INSERT INTO pay(origin_pay, disc_pay, customer_id, orderlist_id, resv_id) 
VALUES (28000,1000,1,1,1);

INSERT INTO pay(origin_pay, disc_pay, customer_id, orderlist_id, resv_id) 
VALUES (24500,1000,2,2,2);

INSERT INTO pay(origin_pay, disc_pay, customer_id, orderlist_id, resv_id) 
VALUES (24000,0,3,3,3);