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