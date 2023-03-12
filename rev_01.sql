/* 1 Gere uma tabela com o id do cliente, a cidade e o estado
onde ele vive.*/

SELECT 
	customer_id,
	customer_city,
	customer_state 
FROM customer c
LIMIT 10

/* 2 Gere uma tabela com o id do cliente e a cidade, somente
dos clientes que vivem em Santa Catarina.*/

SELECT
	customer_id,
	customer_city,
	customer_state 
FROM customer c
WHERE customer_state ='SC' 

/*3. Gere uma tabela com o id do cliente e o estado, somente
dos clientes que vivem em Florianópolis.*/

SELECT 
	customer_id,
	customer_city, 
	customer_state
FROM customer c
WHERE customer_city='florianopolis' 

/*4. Gere uma tabela com o estado, latitude e longitude do
estado de Sã Paulo*/

SELECT 
	geolocation_state,
	geolocation_lat,
	geolocation_lng 
FROM  geolocation g
WHERE geolocation_state='SP'

/*5. Gere uma tabela com o id do produto, a data de envio e
o preço, somente para produtos acima de 6300*/

SELECT 
	order_id,
	shipping_limit_date
FROM order_items oi
WHERE price > 6300 

/*6. Gere uma tabela com o id do pedido, o tipo de
pagamento e o número de parcelas, somente para produtos
com parcelas menores que 1.*/

SELECT
	order_id,
	payment_type 
FROM order_payments op
WHERE payment_installments < 1

/*7. Gere uma tabela com o id do pedido, id do cliente, o
status do pedido e a data de aprovação , somente para
compras aprovadas até dia 05 de Maio de 2016*/

SELECT
	order_id,
	order_status,
	order_approved_at 
FROM orders o
WHERE order_approved_at < '2016-10-05'