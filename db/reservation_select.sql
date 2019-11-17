-- 이메일로 예매내역 확인
SELECT customer.name, title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime,
 cinema, screen.name as screen, type, seat_no FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id 
JOIN selected_seat ON reservation.id = resv_id
WHERE email="interpret96@gmail.com";

-- 이름으로 예매내역 확인
SELECT customer.name, title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime,
 cinema, screen.name as screen, type, seat_no FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id 
JOIN selected_seat ON reservation.id = resv_id 
WHERE customer.name="이해석";

-- 전화번호로 예매내역 확인
SELECT customer.name, title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime,
 cinema, screen.name as screen, type, seat_no FROM reservation
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