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