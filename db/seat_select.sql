-- 서울지점 1상영관의 남은 좌석 개수
SELECT count(is_able) FROM seat
JOIN screen ON screen_id = screen.id
WHERE screen.cinema="SU" AND screen.name="1" AND is_able=1;

-- 서울지점 1상영관의 선택가능한 모든 좌석 출력
SELECT seat_no FROM seat
JOIN screen ON screen_id = screen.id
WHERE screen.cinema="SU" AND screen.name="1" AND is_able=1;