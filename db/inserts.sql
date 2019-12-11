INSERT INTO membership(ranking,benefit) VALUES ("NORMAL",0);
INSERT INTO membership(ranking,benefit) VALUES ("FAMILY",500);
INSERT INTO membership(ranking,benefit) VALUES ("SILVER",1000);
INSERT INTO membership(ranking,benefit) VALUES ("GOLD",1500);
INSERT INTO membership(ranking,benefit) VALUES ("PLATINUM",2000);
INSERT INTO membership(ranking,benefit) VALUES ("VIP",3000);

INSERT INTO customer (name, email, pw, point, ph, membership_id) 
VALUES ('이해석','interpret96@gmail.com', '1234', 15000,'01079794949', "SILVER");
INSERT INTO customer (name, email, pw, point, ph, membership_id) 
VALUES ('김종훈','haeseoklee.dev@gmail.com', '2345', 8000,'01079794949', "GOLD");
INSERT INTO customer (name, email, pw, point, ph, membership_id) 
VALUES ('정희재','jhj967878@naver.com', '123123', 4000,'01064398402', "VIP");

INSERT INTO coupon (name,benefit)
VALUES ('수험생할인',3000);
INSERT INTO coupon (name,benefit)
VALUES ('신규회원할인',1000);
INSERT INTO coupon (name,benefit)
VALUES ('대학생할인',1000);
INSERT INTO coupon (name,benefit)
VALUES ('군인할인',3000);
INSERT INTO coupon (name,benefit)
VALUES ('24세할인',2000);
INSERT INTO coupon (name,benefit)
VALUES ('이벤트할인',2000);

INSERT INTO customer_coupon (customer_id,coupon_id)
VALUES (1,1);
INSERT INTO customer_coupon (customer_id,coupon_id)
VALUES (1,2);
INSERT INTO customer_coupon (customer_id,coupon_id)
VALUES (2,2);

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('신의 한 수: 귀수편', '/movies/images/godshansu.jpg', "리건", "액션","01:46:00", "2019-11-07", "15세 관람가",
"'세상은 둘 중 하나야
놀이터가 되던가, 생지옥이 되던가'
바둑으로 모든 것을 잃은 아이 ‘귀수’
 유일하게 기대던 스승 허일도마저 잃고 홀로 살아남아
 세상을 향한 복수를 계획한다.
 운명의 선택은 神의 놀음판에 있다!
 자신을 사지로 내몬 냉혹한 내기바둑판으로 뛰어든 귀수(권상우)는
 전국을 돌아다니며 귀신 같이 바둑을 두는 자들과 대결을 펼치는데…
 
 사활을 건 대결!
 신의 한 수를 다시 두시겠습니까?");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('조커', '/movies/images/joker.jpg', "토드 필립스", "스릴러", "02:03:00", "2019-10-02", "15세 관람가",
"'내 인생이 비극인줄 알았는데, 코미디였어'
고담시의 광대 아서 플렉은 코미디언을 꿈꾸는 남자.
 하지만 모두가 미쳐가는 코미디 같은 세상에서
 맨 정신으로는 그가 설 자리가 없음을 깨닫게 되는데…
 이제껏 본 적 없는 진짜 ‘조커’를 만나라!");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('겨울왕국 2', '/movies/images/winterkingdom.jpg', "크리스 벅", "애니메이션", "01:43:00", "2019-11-21", "전체 관람가",
"내 마법의 힘은 어디서 왔을까?
나를 부르는 저 목소리는 누구지?
어느 날 부턴가 의문의 목소리가 엘사를 부르고, 평화로운 아렌델 왕국을 위협한다.
 트롤은 모든 것은 과거에서 시작되었음을 알려주며 엘사의 힘의 비밀과 진실을 찾아 떠나야한다고 조언한다.
 
 위험에 빠진 아렌델 왕국을 구해야만 하는 엘사와 안나는 숨겨진 과거의 진실을 찾아
 크리스토프, 올라프 그리고 스벤과 함께 위험천만한 놀라운 모험을 떠나게 된다.
 자신의 힘을 두려워했던 엘사는 이제 이 모험을 헤쳐나가기에 자신의 힘이 충분하다고 믿어야만 하는데…
 
 두려움을 깨고 새로운 운명을 만나다!");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('82년생 김지영', '/movies/images/kimjiyoung.jpg', "김도영", "드라마", "01:58:00", "2019-10-23", "12세 관람가",
"1982년 봄에 태어나
 누군가의 딸이자 아내, 동료이자 엄마로
 2019년 오늘을 살아가는 ‘지영’(정유미).
 때론 어딘가 갇힌 듯 답답하기도 하지만
 남편 ‘대현’(공유)과 사랑스러운 딸,
 그리고 자주 만나지 못해도 항상 든든한 가족들이 ‘지영’에겐 큰 힘이다.
 
 하지만 언젠가부터 마치 다른 사람이 된 것처럼 말하는 ‘지영’.
 ‘대현’은 아내가 상처 입을까 두려워 그 사실을 털어놓지 못하고
 ‘지영’은 이런 ‘대현’에게 언제나 '괜찮다'라며 웃어 보이기만 하는데…
 
 모두가 알지만 아무도 몰랐던
 당신과 나의 이야기");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('블랙머니', '/movies/images/blackmoney.jpg', "정지영", "범죄", "01:53:00", "2019-11-13", "12세 관람가",
"고발은 의무! 수사는 직진!
할말은 하고 깔 건 깐다!
일명 서울지검 ‘막프로’! 검찰 내에서 거침없이 막 나가는 문제적 검사로
 이름을 날리는 ‘양민혁’은 자신이 조사를 담당한 피의자가 자살하는 사건으로 인해
 하루 아침에 벼랑 끝에 내몰린다. 억울한 누명을 벗기 위해 내막을 파헤치던 그는
 피의자가 대한은행 헐값 매각사건의 중요 증인이었음을 알게 된다.
 
 근거는 의문의 팩스 5장! 자산가치 70조 은행이 1조 7천억원에 넘어간
 희대의 사건 앞에서 ‘양민혁’ 검사는 금융감독원, 대형 로펌, 해외펀드 회사가 뒤얽힌
 거대한 금융 비리의 실체와 마주하게 되는데…
 
 대한민국 최대의 금융스캔들, 사건은 아직 끝나지 않았다!");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('윤희에게', '/movies/images/yunhee.jpg', "임대형", "로맨스", "01:45:00", "2019-11-14", "12세 관람가",
"다시 날 가슴 뛰게 만든 그 말
'윤희에게, 잘 지내니?'
평범한 일상을 살아가던 '윤희' 앞으로 도착한 한 통의 편지.
 편지를 몰래 읽어본 딸 '새봄'은 편지의 내용을 숨긴 채
 발신인이 살고 있는 곳으로 여행을 제안하고,
 '윤희'는 비밀스러웠던 첫사랑의 기억으로 가슴이 뛴다.
 '새봄'과 함께 여행을 떠난 ‘윤희’는
 끝없이 눈이 내리는 그곳에서
 첫사랑을 만날지도 모른다는 기대를 품는데…");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('좀비랜드: 더블탭', '/movies/images/zombieland.jpg', "루벤 플레셔", "액션", "01:39:00", "2019-11-13", "15세 관람가",
"좀비로 세상이 망한지 10년,
 자신들만의 재능을 발휘하고 생존 규칙을 지키며
 여전히 꿋꿋하게 살아가고 있는 희한한 가족
 탤러해시, 콜럼버스, 위치타, 리틀록.
 
 하지만 ‘좀비랜드’에 더욱 진화한 좀비가 나타나고
 이들은 새로운 인간 생존자들과 함께 사투를 시작하는데…");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('날씨의 아이', '/movies/images/nalssi.jpg', "신카이 마코토", "애니메이션", "01:52:00", "2019-10-30", "15세 관람가",
"'이제 비는 그치고, 우리의 세상이 빛나기 시작할 거야'
비가 그치지 않던 어느 여름날,
 가출 소년 ‘호다카’는 수상한 잡지사에 취직하게 되고
 비밀스러운 소녀 ‘히나’를 우연히 만난다.
 
 '지금부터 하늘이 맑아질 거야'
 
 그녀의 기도에 거짓말 같이 빗줄기는 멈추고,
 사람들의 얼굴에 환한 빛이 내려온다.
 
 '신기해, 날씨 하나에 사람들의 감정이 이렇게나 움직이다니'
 
 하지만, 맑음 뒤 흐림이 찾아오듯
 두 사람은 엄청난 세계의 비밀을 마주하게 되는데…
 
 흐리기만 했던 세상이 빛나기 시작했고, 그 끝에는 네가 있었다.");

INSERT INTO movie (title, img, director, genre, runtime, releaseday, agelimit, story)
VALUES ('나를 찾아줘', '/movies/images/findme.jpg', "김승우", "스릴러", "01:48:00","2019-11-27", "15세 관람가",
"6년 전 실종된 아들을 봤다는 연락을 받은 ‘정연’(이영애).
 숱하게 반복되던 거짓 제보와 달리
 생김새부터 흉터까지 똑같은 아이를 봤다는 낯선 이의 이야기에
 ‘정연’은 지체 없이 홀로 낯선 곳으로 향한다.
 
 하지만 자신의 등장을 경계하는 듯한 경찰 ‘홍경장’(유재명)과
 비슷한 아이를 본 적도 없다는 마을 사람들.
 그들이 뭔가 숨기고 있음을 직감한 ‘정연’은
 포기하지 않고 진실을 찾기 시작하는데…
 
 6년 전 사라진 아이
 그리고 낯선 사람들
 모두가 숨기고 있다");

INSERT INTO cinema(cinema,tel,address) VALUES ("서울목동", "02-1234-5678", "서울특별시 양천구 목동동로 24");
INSERT INTO cinema(cinema,tel,address) VALUES ("인천송도", "032-1111-2424", "인천광역시 연수구 청능대로 240");
INSERT INTO cinema(cinema,tel,address) VALUES ("대전터미널", "042-2323-5555", "대전광역시 동구 동서대로 2400");
INSERT INTO cinema(cinema,tel,address) VALUES ("대구현대", "053-8282-4141", "대구광역시 중구 달구벌대로 2323");
INSERT INTO cinema(cinema,tel,address) VALUES ("울산진장", "052-1212-2121", "울산광역시 북구 진장유통로 24-10");
INSERT INTO cinema(cinema,tel,address) VALUES ("광주터미널", "062-7777-0815", "광주광역시 서구 무진대로 430");
INSERT INTO cinema(cinema,tel,address) VALUES ("센텀시티", "051-6666-8624", "부산광역시 해운대구 센텀남대로 180");


INSERT INTO screen (name,cinema)
VALUES (1,"서울목동");
INSERT INTO screen (name,cinema)
VALUES (2,"서울목동");
INSERT INTO screen (name,cinema)
VALUES (3,"서울목동");
INSERT INTO screen (name,cinema)
VALUES (4,"서울목동");
INSERT INTO screen (name,cinema)
VALUES (5,"서울목동");
INSERT INTO screen (name,cinema)
VALUES (1,"인천송도");
INSERT INTO screen (name,cinema)
VALUES (2,"인천송도");
INSERT INTO screen (name,cinema)
VALUES (3,"인천송도");
INSERT INTO screen (name,cinema)
VALUES (4,"인천송도");
INSERT INTO screen (name,cinema)
VALUES (5,"인천송도");
INSERT INTO screen (name,cinema)
VALUES (1,"대전터미널");
INSERT INTO screen (name,cinema)
VALUES (2,"대전터미널");
INSERT INTO screen (name,cinema)
VALUES (3,"대전터미널");
INSERT INTO screen (name,cinema)
VALUES (4,"대전터미널");
INSERT INTO screen (name,cinema)
VALUES (5,"대전터미널");
INSERT INTO screen (name,cinema)
VALUES (1,"대구현대");
INSERT INTO screen (name,cinema)
VALUES (2,"대구현대");
INSERT INTO screen (name,cinema)
VALUES (3,"대구현대");
INSERT INTO screen (name,cinema)
VALUES (4,"대구현대");
INSERT INTO screen (name,cinema)
VALUES (5,"대구현대");
INSERT INTO screen (name,cinema)
VALUES (1,"울산진장");
INSERT INTO screen (name,cinema)
VALUES (2,"울산진장");
INSERT INTO screen (name,cinema)
VALUES (3,"울산진장");
INSERT INTO screen (name,cinema)
VALUES (4,"울산진장");
INSERT INTO screen (name,cinema)
VALUES (5,"울산진장");
INSERT INTO screen (name,cinema)
VALUES (1,"광주터미널");
INSERT INTO screen (name,cinema)
VALUES (2,"광주터미널");
INSERT INTO screen (name,cinema)
VALUES (3,"광주터미널");
INSERT INTO screen (name,cinema)
VALUES (4,"광주터미널");
INSERT INTO screen (name,cinema)
VALUES (5,"광주터미널");
INSERT INTO screen (name,cinema)
VALUES (1,'센텀시티');
INSERT INTO screen (name,cinema)
VALUES (2,'센텀시티');
INSERT INTO screen (name,cinema)
VALUES (3,'센텀시티');
INSERT INTO screen (name,cinema)
VALUES (4,'센텀시티');
INSERT INTO screen (name,cinema)
VALUES (5,'센텀시티');

DELIMITER $$

CREATE PROCEDURE timetable_insert()
BEGIN

    DECLARE i INT DEFAULT 0;

    WHILE (i <= 30) DO

        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (1, 5+i, '2019-12-24', '08:00', '2019-12-24', '09:46');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (1, 5+i, '2019-12-24', '20:00', '2019-12-24', '21:46');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (2, 4+i, '2019-12-24', '08:00', '2019-12-24', '10:03');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (2, 4+i, '2019-12-24', '20:00', '2019-12-24', '22:03');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (3, 3+i, '2019-12-24', '08:00', '2019-12-24', '09:43');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (3, 3+i, '2019-12-24', '20:00', '2019-12-24', '21:43');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (4, 2+i, '2019-12-24', '08:00', '2019-12-24', '09:58');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (4, 2+i, '2019-12-24', '20:00', '2019-12-24', '21:58');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (5, 1+i, '2019-12-24', '08:00', '2019-12-24', '09:53');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (5, 1+i, '2019-12-24', '20:00', '2019-12-24', '21:53');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (6, 5+i, '2019-12-24', '11:00', '2019-12-24', '12:45');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (6, 5+i, '2019-12-24', '16:00', '2019-12-24', '17:45');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (7, 4+i, '2019-12-24', '11:00', '2019-12-24', '12:39');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (7, 4+i, '2019-12-24', '16:00', '2019-12-24', '17:39');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (8, 3+i, '2019-12-24', '11:00', '2019-12-24', '12:52');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (8, 3+i, '2019-12-24', '16:00', '2019-12-24', '17:52');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (9, 2+i, '2019-12-24', '11:00', '2019-12-24', '12:48');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (9, 2+i, '2019-12-24', '16:00', '2019-12-24', '17:48');

        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (1, 5+i, '2019-12-25', '08:00', '2019-12-25', '09:46');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (1, 5+i, '2019-12-25', '20:00', '2019-12-25', '21:46');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (2, 4+i, '2019-12-25', '08:00', '2019-12-25', '10:03');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (2, 4+i, '2019-12-25', '20:00', '2019-12-25', '22:03');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (3, 3+i, '2019-12-25', '08:00', '2019-12-25', '09:43');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (3, 3+i, '2019-12-25', '20:00', '2019-12-25', '21:43');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (4, 2+i, '2019-12-25', '08:00', '2019-12-25', '09:58');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (4, 2+i, '2019-12-25', '20:00', '2019-12-25', '21:58');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (5, 1+i, '2019-12-25', '08:00', '2019-12-25', '09:53');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (5, 1+i, '2019-12-25', '20:00', '2019-12-25', '21:53');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (6, 5+i, '2019-12-25', '11:00', '2019-12-25', '12:45');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (6, 5+i, '2019-12-25', '16:00', '2019-12-25', '17:45');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (7, 4+i, '2019-12-25', '11:00', '2019-12-25', '12:39');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (7, 4+i, '2019-12-25', '16:00', '2019-12-25', '17:39');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (8, 3+i, '2019-12-25', '11:00', '2019-12-25', '12:52');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (8, 3+i, '2019-12-25', '16:00', '2019-12-25', '17:52');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (9, 2+i, '2019-12-25', '11:00', '2019-12-25', '12:48');
        INSERT INTO timetable(movie_id, screen_id, startdate, starttime, enddate, endtime)
        VALUES (9, 2+i, '2019-12-25', '16:00', '2019-12-25', '17:48');
        SET i = i + 5;
    END WHILE;
END$$

DELIMITER ;
CALL timetable_insert();


INSERT INTO reservation(timetable_id, customer_id)
VALUES (1,1);
INSERT INTO reservation(timetable_id, customer_id)
VALUES (3,2);
INSERT INTO reservation(timetable_id, customer_id)
VALUES (5,3);

INSERT INTO menu(name, img, price) VALUES ("오리지널 팝콘", '/menu/images/popcorn.jpg', 5000);
INSERT INTO menu(name, img, price) VALUES ("카라멜 팝콘", '/menu/images/sweetpopcorn.jpg', 5500);
INSERT INTO menu(name, img, price) VALUES ("어니언 팝콘", '/menu/images/onionpopcorn.jpg', 5500);
INSERT INTO menu(name, img, price) VALUES ("치즈 팝콘", '/menu/images/cheesepopcorn.jpg', 5500);
INSERT INTO menu(name, img, price) VALUES ("탄산음료", '/menu/images/tansan.jpg', 2000);
INSERT INTO menu(name, img, price) VALUES ("에이드음료", '/menu/images/ade.jpg', 2500);
INSERT INTO menu(name, img, price) VALUES ("나쵸치즈", '/menu/images/nacho.jpg', 3000);
INSERT INTO menu(name, img, price) VALUES ("오징어버터구이", '/menu/images/ojing.jpg', 3000);


INSERT INTO orderlist(customer_id, cinema) VALUES (1,"서울목동");
INSERT INTO orderlist(customer_id, cinema) VALUES (2,"서울목동");
INSERT INTO orderlist(customer_id, cinema) VALUES (3,"서울목동");

INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(2, 1, 1);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(2, 5, 1);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(1, 2, 2);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(2, 6, 2);
INSERT INTO menu_order(amount, menu_id, orderlist_id) VALUES(1, 8, 3);

DELIMITER $$

CREATE PROCEDURE seat_insert()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE (i <= 252) DO
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "A10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "B10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "C10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "D10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "E10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "F10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "G10", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H01", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H02", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H03", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H04", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H05", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H06", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H07", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H08", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H09", 1);
        INSERT INTO seat(timetable_id, seat_no, is_able) VALUES (i, "H10", 1);
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
CALL seat_insert();

INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(1, 1, 'A01');
INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(1, 1, 'A02');

INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(2, 3, 'A01');
INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(2, 3, 'A02');

INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(3, 5, 'A01');
INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(3, 5, 'A02');
INSERT INTO selected_seat(resv_id, timetable_id,seat_no) 
VALUES(3, 5, 'A03');

UPDATE seat SET is_able=0 WHERE timetable_id=1 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE timetable_id=1 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE timetable_id=3 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE timetable_id=3 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE timetable_id=5 AND seat_no='A01';
UPDATE seat SET is_able=0 WHERE timetable_id=5 AND seat_no='A02';
UPDATE seat SET is_able=0 WHERE timetable_id=5 AND seat_no='A03';

INSERT INTO ticket_pay(origin_pay, disc_pay, customer_id, resv_id)
VALUES (14000,1000,1,1);

INSERT INTO ticket_pay(origin_pay, disc_pay, customer_id, resv_id) 
VALUES (14000,1000,2,2);

INSERT INTO ticket_pay(origin_pay, disc_pay, customer_id, resv_id) 
VALUES (21000,0,3,3);


INSERT INTO snack_pay(origin_pay, disc_pay, customer_id, orderlist_id)
VALUES (14000,0,1,1);

INSERT INTO snack_pay(origin_pay, disc_pay, customer_id, orderlist_id) 
VALUES (10500,0,2,2);

INSERT INTO snack_pay(origin_pay, disc_pay, customer_id, orderlist_id) 
VALUES (3000,0,3,3);
