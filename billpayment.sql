use billpayment


ALTER TABLE orders ADD COLUMN margin_admin_fee float default 0;

select * from product_sku   
select * from product_partner where product_sku_code = "PLS-ISAT-2" 

select * from order_detail od o  

select o.id,o.created_at,o.updated_at, od.check_status_retry,od.created_at,od.updated_at from orders o 
join order_detail od on o.id = od.order_id 
where o.payment_status = ? and o.order_status = ?


select o.id, IFNULL(od.check_status_retry, 0) as retry_time, od.created_at, od.updated_at from orders o 
			join order_detail od on o.id = od.order_id 
				where od.check_status_retry <=3 or od.check_status_retry is NULL ;
			
