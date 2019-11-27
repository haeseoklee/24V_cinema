-- 이메일로 예매내역 확인
SELECT email, title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime,
 cinema, screen.name, type FROM reservation
JOIN timetable ON reservation.timetable_id = timetable.id
JOIN customer ON reservation.customer_id = customer.id
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id 
WHERE email="interpret96@gmail.com";