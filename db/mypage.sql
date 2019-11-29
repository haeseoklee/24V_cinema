-- 마이페이지 전용 SELECTION
-- 포인트
SELECT customer.point FROM customer WHERE id=1;

-- 멤버쉽
SELECT membership.ranking FROM membership
JOIN customer ON membership.ranking = customer.membership_id
WHERE customer.id = 1;

-- 휴대전화
SELECT customer.ph FROM customer WHERE id=1;
SELECT customer.email FROM customer WHERE id=1;

-- 보유중인 쿠폰
SELECT CONCAT("CP00000", customer_coupon.id) as coupon_code , coupon.name, coupon.benefit FROM coupon
JOIN customer_coupon ON customer_coupon.coupon_id = coupon.id
JOIN customer ON customer_coupon.customer_id = customer.id
WHERE customer.id=1;

-- 예매내역(좌석X)
SELECT CONCAT("RS00000",reservation.id) as resv_id,
date_format(resv_date, "%Y-%m-%d") as resv_date, customer.name, title, startdate, starttime,
 cinema, screen.name as screen FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id 
WHERE customer.id=1
ORDER BY reservation.id DESC;

-- 예매 좌석
SELECT seat_no FROM selected_seat
JOIN reservation ON reservation.id = selected_seat.resv_id
JOIN customer ON reservation.customer_id = customer.id
<<<<<<< HEAD
WHERE customer.id=2 AND reservation.id =
(SELECT max(reservation.id) FROM reservation JOIN customer ON reservation.customer_id = customer.id
WHERE customer.id=2);
=======
WHERE customer.id=1 and reservation.id = (select max(reservation.id) from reservation);
>>>>>>> haeseok

-- 매점 이용정보(예매번호, 날짜, 지점)
SELECT CONCAT("OL00000",orderlist.id) as order_id,
date_format(order_date, "%Y-%m-%d") as order_date, cinema.cinema FROM orderlist
JOIN customer ON customer.id = orderlist.customer_id
JOIN cinema ON orderlist.cinema = cinema.cinema
WHERE customer.id = 1
ORDER BY orderlist.id DESC LIMIT 1;

-- 매점 주문내역
SELECT menu.name, amount
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE customer.id=3 AND orderlist.id =
(SELECT max(orderlist.id) FROM orderlist JOIN customer ON orderlist.customer_id = customer.id
WHERE customer.id=3);