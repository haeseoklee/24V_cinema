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
    screen_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    is_able TINYINT NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES screen (id),
    PRIMARY KEY (screen_id, seat_no)
);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (1, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (2, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (3, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (4, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (5, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (6, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (7, "H10", 1);

INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "A10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "B10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "C10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "D10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "E10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "F10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "G10", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H01", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H02", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H03", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H04", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H05", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H06", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H07", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H08", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H09", 1);
INSERT INTO seat(screen_id, seat_no, is_able) VALUES (8, "H10", 1);

CREATE TABLE selected_seat(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    resv_id INT NOT NULL,
    screen_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (resv_id) REFERENCES reservation (id),
    FOREIGN KEY (screen_id, seat_no) REFERENCES seat (screen_id, seat_no)
);

INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(1, 2, 'A01');
INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(1, 2, 'A02');

INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(2, 5, 'A01');
INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(2, 5, 'A02');

INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(3, 8, 'A01');
INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(3, 8, 'A02');
INSERT INTO selected_seat(resv_id, screen_id, seat_no) 
VALUES(3, 8, 'A03');

-- 좌석 선태에 의한 is_able 값 변경
UPDATE seat SET is_able=0 WHERE screen_id=2 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE screen_id=2 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE screen_id=5 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE screen_id=5 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE screen_id=8 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE screen_id=8 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE screen_id=8 AND seat_no='A03';