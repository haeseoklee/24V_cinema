-- 이메일로 예매내역 확인
SELECT customer.name, title, startdate, starttime, endtime,
 cinema, screen.name as screen, seat_no FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id 
JOIN selected_seat ON reservation.id = resv_id
WHERE email="interpret96@gmail.com";

-- 이름으로 예매내역 확인
SELECT customer.name, title, startdate, starttime, endtime,
 cinema, screen.name as screen, seat_no FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id 
JOIN selected_seat ON reservation.id = resv_id 
WHERE customer.name="이해석";

-- 예매내역 확인(좌석제외)
SELECT customer.name, title, startdate, starttime, endtime,
 cinema, screen.name as screen FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id
WHERE customer.name="이해석";

-- 전화번호로 예매내역 확인
SELECT customer.name, title, startdate, starttime, endtime,
 cinema, screen.name as screen, seat_no FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id
JOIN selected_seat ON reservation.id = resv_id  
WHERE ph="01064398402";

-- 지점별 예매 매출
SELECT cinema, count(seat_no)*7000 FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id 
JOIN screen ON timetable.screen_id = screen.id 
JOIN selected_seat ON reservation.id = resv_id 
GROUP BY cinema HAVING cinema = "SU";

-- 이름으로 주문메뉴 확인
SELECT customer.name, menu.name, amount, menu.price*amount as price, cinema.cinema
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN cinema ON orderlist.cinema = cinema.cinema
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE customer.name="정희재";

-- 이메일로 주문메뉴 확인
SELECT customer.name, menu.name, amount, cinema 
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN cinema ON orderlist.cinema = cinema.cinema
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE customer.email="interpret96@gmail.com";

-- 지점별 매점 판매 내역
SELECT customer.name, menu.name, amount, menu.price*amount as price, cinema.cinema 
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN cinema ON orderlist.cinema = cinema.cinema
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE cinema="SU";

-- 지점별 매점 매출
SELECT cinema, sum(amount*price) FROM orderlist 
JOIN menu_order ON orderlist_id = orderlist.id
JOIN cinema ON orderlist.cinema = cinema.cinema
JOIN menu ON menu_id = menu.id
GROUP BY cinema HAVING cinema="SU";

-- 이메일로 결제 금액 확인
SELECT customer.email ,(origin_pay - disc_pay) as pay FROM pay 
JOIN customer ON pay.customer_id = customer.id
WHERE customer.email = "jhj967878@naver.com";

-- 이메일로 매점 주문금액 확인
SELECT customer.email, sum(menu.price*amount) as snack_pay
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN snackbar ON snackbar_id = snackbar.id
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id 
GROUP BY customer.email HAVING customer.email = "jhj967878@naver.com";

-- 이메일로 예매 금액 확인
SELECT customer.email, count(seat_no)*7000 as ticket_pay FROM customer
JOIN reservation ON customer_id = customer.id  
JOIN selected_seat ON reservation.id = resv_id 
GROUP BY customer.email HAVING customer.email = "jhj967878@naver.com";

-- 매점 총 매출
SELECT sum(origin_pay-disc_pay) FROM pay;

-- 영화, 지점으로 타임테이블 아이디 알아내기

SELECT timetable.id, cinema.cinema, screen.name as screen
, starttime FROM timetable
JOIN movie ON movie_id = movie.id 
JOIN screen ON screen_id = screen.id
JOIN cinema ON screen.cinema = cinema.cinema 
WHERE movie.title = "조커" AND cinema.cinema = "SU";

-- 지점과 날짜를 통해 타임테이블 뽑기
SELECT movie.title, screen.cinema, starttime, 
screen.name as screen FROM timetable
JOIN MOVIE ON timetable.movie_id = movie.id 
JOIN screen ON timetable.screen_id = screen.id 
WHERE startdate = "2019-11-17" AND screen.cinema = "SU"
ORDER BY starttime;