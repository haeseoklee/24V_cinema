-- 서울지점의 상영시간표
SELECT title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime, cinema, screen.name, type FROM timetable
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id
WHERE cinema="SU";

-- 터미네이터: 다크 페이트의 상영시간표
SELECT title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime, cinema, screen.name, type FROM timetable
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id
WHERE title="터미네이터: 다크 페이트";

-- 2019년 11월 16일 9시 이전의 상영시간표
SELECT title, DATE_FORMAT(starttime,'%Y-%m-%d %H:%i') as starttime,
 DATE_FORMAT(endtime,'%Y-%m-%d %H:%i') as endtime, cinema, screen.name, type FROM timetable
JOIN screen ON timetable.screen_id = screen.id
JOIN movie ON timetable.movie_id = movie.id
WHERE starttime <= "2019-11-16 09:00";