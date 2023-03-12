/*1. Qual o número de clientes únicos de todos os estados?*/
SELECT 
	customer_state, 
	COUNT(DISTINCT customer_id) 
FROM customer c
GROUP BY customer_state

/*2. Qual o número de cidades únicas de todos os estados?*/

SELECT
	customer_state, 
	COUNT(DISTINCT customer_city) AS CITY_UNIQUE
FROM customer c 
GROUP BY customer_state 

/*3. Qual o número de clientes únicos por estado e por
cidade?*/

SELECT 
	customer_state,
	customer_city, 
	COUNT(DISTINCT customer_id) AS CLIENT_UNIQ_STATE_CITY
FROM customer c 
GROUP BY customer_state, customer_city

/*4. Qual o número de clientes únicos por cidade e por
estado?*/

SELECT 
	customer_city,
	customer_state,
	COUNT(DISTINCT customer_id) 
FROM customer c 
GROUP BY customer_city, customer_state

/*5. Qual o número total de pedidos únicos acima de R$
3.500 por cada vendedor?*/

SELECT
	seller_id,
	COUNT(DISTINCT order_id) 
FROM order_items oi 
WHERE price > 3500
GROUP BY seller_id 

/*6. Qual o número total de pedidos únicos, a data mínima e
máxima de envio, o valor máximo, mínimo e médio do frete
dos pedidos acima de R$ 1.100 por cada vendedor?*/

SELECT
	seller_id, 
	COUNT(DISTINCT order_id),
	MIN(shipping_limit_date),
	MAX(shipping_limit_date),
	MIN(freight_value),
	AVG(freight_value),
	MAX(freight_value)
FROM order_items oi
WHERE price > 1100
GROUP BY seller_id 

/*7. Qual o valor médio, máximo e mínimo do preço de todos
os pedidos de cada produto? */

SELECT 
	product_id, 
	MIN(price),
	AVG(price),
	MAX(price) 
FROM order_items oi
GROUP BY product_id 

/*8. Qual a quantidade de vendedores distintos que
receberam algum pedido antes do dia 23 de setembro de
2016 e qual foi o preço médio desses pedidos?*/

SELECT
	shipping_limit_date, 
	COUNT(DISTINCT seller_id),
	AVG(price) 
FROM order_items oi  
WHERE shipping_limit_date < '2016-09-23 00:00:00'
GROUP BY shipping_limit_date 

/*10. Qual a quantidade de pedidos por tipo de pagamentos?
*/

SELECT 
	payment_type, 
	COUNT(DISTINCT order_id) 
FROM order_payments op  
GROUP BY payment_type 

/*11. Qual a quantidade de pedidos, a média do valor do
pagamento e o número máximo de parcelas por tipo de
pagamentos?*/

SELECT 
	payment_type, 
	COUNT(DISTINCT order_id),
	AVG(payment_value), 
	MAX(payment_installments) 
FROM order_payments op  
GROUP BY payment_type 


/*12. Qual a valor mínimo, máximo, médio e as soma total
paga por cada tipo de pagamento e número de parcelas
disponíveis?*/

SELECT 
	payment_type, 
	payment_installments,  
	MIN(payment_value),
	MAX(payment_value), 
	AVG(payment_value),
	sum(payment_value)
FROM order_payments op  
GROUP BY payment_type, payment_installments 

/*14. Qual a média de pedidos por cliente?*/

SELECT
	customer_id, 
	AVG(order_id) 
FROM orders o
GROUP BY customer_id 
 
/*15. Qual a quantidade de pedidos realizados por cada
status do pedido, a partir do dia 23 de Setembro de 2016?*/

SELECT
	order_status, 
	COUNT(DISTINCT order_id)
FROM orders o 
WHERE order_approved_at > '2016-09-23 00:00:00'
GROUP BY order_status

/*16. Qual a quantidade de pedidos realizados por dia, a
partir do dia 23 de Setembro de 2016?
*/

SELECT
	DATE( order_approved_at), 
	COUNT(DISTINCT order_id) 
FROM orders o 
WHERE '2016-09-23 00:00:00'
GROUP BY DATE (order_approved_at)


/*17. Quantos produtos estão cadastrados na empresa por
categoria?
*/

SELECT 
	*
FROM product_category_name pcn 

SELECT 
	COUNT(product_category_name) 
FROM product_category_name pcn 

SELECT 
	COUNT( DISTINCT product_category_name) 
FROM product_category_name pcn

SELECT 
	product_category_name, 
	COUNT(DISTINCT product_category_name ) 
FROM products p
GROUP BY product_category_name 


