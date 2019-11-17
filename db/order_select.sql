-- 이름으로 주문메뉴 확인
SELECT customer.name, menu.name, amount, menu.price*amount as price, cinema 
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN snackbar ON snackbar_id = snackbar.id
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE customer.name="정희재";

-- 이메일로 주문메뉴 확인
SELECT customer.name, menu.name, amount, cinema 
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN snackbar ON snackbar_id = snackbar.id
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE customer.email="interpret96@gmail.com";

-- 지점별 매점 판매 내역
SELECT customer.name, menu.name, amount, menu.price*amount as price, snackbar.cinema 
FROM orderlist
JOIN customer ON customer_id = customer.id
JOIN snackbar ON snackbar_id = snackbar.id
JOIN menu_order ON orderlist_id = orderlist.id
JOIN menu ON menu_id = menu.id
WHERE cinema="SU";

-- 지점별 매점 매출
SELECT cinema, sum(amount*price) FROM orderlist 
JOIN menu_order ON orderlist_id = orderlist.id
JOIN snackbar ON snackbar_id = snackbar.id
JOIN menu ON menu_id = menu.id
GROUP BY cinema HAVING cinema="IC";