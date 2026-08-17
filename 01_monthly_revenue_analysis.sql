SELECT 
  DATE_TRUNC(EXTRACT(DATE FROM o.order_purchase_timestamp), MONTH) AS order_month,
  ROUND(SUM(p.payment_value), 2) AS total_revenue,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM `bellabeat-data-481319.ecommerce_analysis.orders` o
JOIN `bellabeat-data-481319.ecommerce_analysis.order payments` p 
  ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1 ASC;
