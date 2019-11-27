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
SELECT customer.name, menu.name, amount, cinema.cinema 
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

-- 영화 런타임 분단위로 환산
SELECT HOUR(runtime)*60 + MINUTE(runtime) FROM movie;

-- (예매 + 주문) 개인이 지불해야할 금액
SELECT customer.name, customer.email, origin_pay-disc_pay FROM pay
JOIN reservation ON pay.resv_id = reservation.id
JOIN customer ON reservation.customer_id = customer.id;

-- pay 안쓰고 개인 예매금액 확인
SELECT customer.name, count(seat_no)*7000 as ticket_pay FROM customer
JOIN reservation ON customer_id = customer.id  
JOIN selected_seat ON reservation.id = resv_id 
GROUP BY customer.name HAVING customer.name = "정희재";

-- pay 안쓰고 개인 주문금액 확인
SELECT customer.name, sum(price*amount) FROM orderlist
JOIN customer ON orderlist.customer_id = customer.id
JOIN menu_order ON menu_order.orderlist_id = orderlist.id
JOIN menu ON menu_order.menu_id = menu.id
GROUP BY customer.name;

-- pay 에 직접 넣은거 말고 조인으로 original pay 뽑기
SELECT customer.name, (count(seat_no)*7000)+sum(price*amount) as ticket_pay FROM customer
JOIN reservation ON customer_id = customer.id  
JOIN selected_seat ON reservation.id = resv_id
JOIN orderlist ON orderlist.customer_id = customer.id
JOIN menu_order ON menu_order.orderlist_id = orderlist.id
JOIN menu ON menu_order.menu_id = menu.id
GROUP BY customer.name HAVING customer.name = "정희재";

SELECT customer.name, seat_no, price, amount FROM customer
JOIN reservation ON customer_id = customer.id  
JOIN selected_seat ON reservation.id = resv_id
JOIN orderlist ON orderlist.customer_id = customer.id
JOIN menu_order ON menu_order.orderlist_id = orderlist.id
JOIN menu ON menu_order.menu_id = menu.id
GROUP BY customer.name HAVING customer.name = "정희재";

-- 영화이름, 지점, 날짜, 시간을 다 골랐을 때 타임테이블의 아이디
SELECT timetable.id, movie.title, screen.cinema, startdate, starttime, screen.name
FROM timetable
JOIN movie ON timetable.movie_id = movie.id
JOIN screen ON timetable.screen_id = screen.id
JOIN cinema ON screen.cinema = cinema.cinema
WHERE movie.title = "조커" AND screen.cinema = "DJ"
AND startdate = "2019-11-17" AND starttime = "08:00:00";

SELECT timetable.id FROM timetable
JOIN movie ON timetable.movie_id = movie.id
JOIN screen ON timetable.screen_id = screen.id
JOIN cinema ON screen.cinema = cinema.cinema
WHERE movie.title = "조커" AND screen.cinema = "DJ"
AND startdate = "2019-11-17" AND starttime = "08:00:00";

-- 이름, 이메일로 고객번호 찾기
SELECT customer.id, customer.name, customer.email FROM customer
WHERE customer.name = "정희재" AND customer.email = "jhj967878@naver.com";

-- 타임테이블별 선택가능한 좌석
SELECT seat_no FROM seat
JOIN timetable ON seat.timetable_id = timetable.id
WHERE seat.is_able = 1 AND timetable.id = 1;

-- 타임테이블별 선택가능한 좌석개수
SELECT count(seat_no) FROM seat
JOIN timetable ON seat.timetable_id = timetable.id
WHERE seat.is_able = 1 AND timetable.id = 1;

-- 지점별 상영시간표
SELECT movie.title, screen.cinema, startdate, starttime, 
screen.name as screen FROM timetable
JOIN MOVIE ON timetable.movie_id = movie.id 
JOIN screen ON timetable.screen_id = screen.id 
WHERE startdate = "2019-11-17" AND screen.cinema = "SU"
ORDER BY startdate, starttime;

-- 보유중인 쿠폰(이름, 이메일)
SELECT customer.name, customer.email, coupon.name, coupon.benefit FROM coupon
JOIN customer_coupon ON customer_coupon.coupon_id = coupon.id
JOIN customer ON customer_coupon.customer_id = customer.id
WHERE customer.name = "이해석" AND customer.email = "interpret96@gmail.com";

-- 보유중인 쿠폰(customer_id)
SELECT customer.name, customer.email, coupon.name, coupon.benefit FROM coupon
JOIN customer_coupon ON customer_coupon.coupon_id = coupon.id
JOIN customer ON customer_coupon.customer_id = customer.id
WHERE customer.id=1;