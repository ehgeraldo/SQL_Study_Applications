/*1. Gere uma tabela com as seguintes colunas: categoria,
comprimento, altura e largura do produto.,*/

SELECT 
	product_category_name, 
	product_length_cm,
	product_height_cm,
	product_width_cm 
FROM products p 
LIMIT 10

/*WHERE 
/*GROUP BY


/*2.Gere uma tabela com o id, cidade e estado do cliente que
vivem no estado do Rio de Janeiro*/

SELECT 
	customer_id,
	customer_city,
	customer_state 
FROM customer c 
WHERE customer_state ='RJ'
--GROUP BY 
LIMIT 10


/*3. Gere uma tabela com o id do produto, o id do seller, a data
de envio e o preço, somente para produtos com preço abaixo
de R$1,00
*/

SELECT 
 	product_id,
 	seller_id,
 	shipping_limit_date,
 	price 
FROM order_items oi 
WHERE price < 1
--GROUP BY 
--LIMIT  

/*4. Gere uma tabela com o id do pedido, o tipo de pagamento e
o número de parcelas, somente para produtos com parcelas
maiores que 23
*/

SELECT 
	order_id,
	payment_type,
	payment_installments 
FROM order_payments op 
WHERE payment_installments  > 23
--GROUP BY 
--LIMIT 


