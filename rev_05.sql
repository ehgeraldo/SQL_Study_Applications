/*1. Qual o número de clientes únicos nos estado de Minas Gerais ou Rio de
Janeiro?*/

SELECT 
	COUNT(DISTINCT customer_id) 
FROM customer c 
WHERE customer_state ='MG' OR customer_state='RJ'
GROUP BY customer_state 

/*2. Qual a quantidade de cidades únicas dos vendedores no estado de São
Paulo ou Rio de Janeiro com a latitude maior que -24.54 e longitude menor que
-45.63?*/

SELECT 
	COUNT(DISTINCT geolocation_city) 
FROM geolocation g 
WHERE geolocation_state = 'SP' OR geolocation_state ='RJ' AND  geolocation_lat > -24.54 AND geolocation_lng < -45.63
GROUP BY geolocation_state 

/*4. Mostre a quantidade total dos pedidos e o valor total do pagamento, para
pagamentos entre 1 e 5 prestações ou um valor de pagamento acima de R$
5000.
*/

SELECT
	payment_type,
	payment_installments, 
	COUNT(order_id),
	SUM(payment_value) 
FROM order_payments op 
WHERE (payment_installments >= 1 AND payment_installments < 5) OR payment_value >= 5000
GROUP BY payment_type, payment_installments


/*5. Qual a quantidade de pedidos com o status em processamento ou
cancelada acontecem com a data estimada de entrega maior que 01 de Janeiro
de 2017 ou menor que 23 de Novembro de 2016?*/

SELECT 
	order_status, 
	COUNT(order_id) 
FROM orders o 
WHERE (order_status = 'processing' OR order_status ='canceled') AND (order_estimated_delivery_date  > '2017-01-01' OR order_estimated_delivery_date  < '2016-11-23') 
GROUP BY order_status

/*6. Quantos produtos estão cadastrados nas categorias: perfumaria,
brinquedos, esporte lazer, cama mesa e banho e móveis de escritório que
possuem mais de 5 fotos, um peso maior que 5 g, um altura maior que 10 cm,
uma largura maior que 20 cm?*/

SELECT 
	product_category_name,
	product_photos_qty, 
	COUNT(DISTINCT product_id) 
FROM products p 
WHERE (product_category_name = 'perfumaria' OR 
	product_category_name ='brinquedos' OR 
	product_category_name ='esporte_lazer' OR 
	product_category_name ='cama_mesa_banho' OR
	product_category_name ='moveis_escritorio')
	AND product_photos_qty > 5
	AND product_weight_g > 5
	AND product_height_cm > 10
	AND product_width_cm > 20
GROUP BY product_category_name 

