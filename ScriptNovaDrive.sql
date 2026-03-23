
/* ----------------------------------------------------------------------------------------------------*/


SELECT 
    AVG(total_dia) AS media_7_dias
FROM (
    SELECT 
        DATE(data_venda) AS dia,
        COUNT(*) AS total_dia
    FROM vendas
    WHERE data_venda >= CURRENT_DATE - INTERVAL '7 days'
    GROUP BY DATE(data_venda)
) t;




/*-------------------------------------------------------------------------------------------------*/

SELECT 
    COUNT(*) AS total_vendas_ontem,
    SUM(valor_pago) AS valor_total_ontem
FROM vendas
WHERE DATE(data_venda) = CURRENT_DATE - INTERVAL '1 day';

/*-------------------------------------------------------------------------------------------------*/


SELECT
    v.nome AS veiculo,
    c.concessionaria,
    e.estado,
    e.sigla,
    COUNT(*) AS total_vendas,
    SUM(vd.valor_pago) AS valor_total,
    AVG(vd.valor_pago) AS ticket_medio,
    MAX(vd.data_venda) AS ultima_venda
FROM vendas vd
JOIN veiculos v 
    ON vd.id_veiculos = v.id_veiculos
JOIN concessionarias c 
    ON vd.id_concessionarias = c.id_concessionarias
JOIN cidades ci
    ON c.id_cidades = ci.id_cidades
JOIN estados e
    ON ci.id_estados = e.id_estados
WHERE vd.data_venda >= NOW() - INTERVAL '30 days'
GROUP BY v.nome, c.concessionaria, e.estado, e.sigla
ORDER BY valor_total DESC;


/*--------------------------------------------------------------------------------------------------------------------*/


getSalesbyState:

SELECT e.sigla AS state, e.estado AS state_name, COUNT(*)::int AS total_sales, COALESCE(SUM(v.valor_pago),0)::numeric(12,2) AS total_revenue
FROM vendas v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
JOIN cidades ci ON ci.id_cidades = c.id_cidades
JOIN estados e ON e.id_estados = ci.id_estados
GROUP BY e.sigla, e.estado
ORDER BY total_revenue DESC;

/*-------------------------------------------------------------------------------------------------*/

getTopVehicles:

SELECT ve.nome AS vehicle, ve.tipo AS type, COUNT(*)::int AS total_sales, COALESCE(SUM(v.valor_pago),0)::numeric(12,2) AS total_revenue
FROM vendas v
JOIN veiculos ve ON ve.id_veiculos = v.id_veiculos
GROUP BY ve.nome, ve.tipo
ORDER BY total_sales DESC
LIMIT 5;

/*-------------------------------------------------------------------------------------------------*/

getSalesSummary:

SELECT COUNT(*)::int AS total_sales, COALESCE(SUM(valor_pago),0)::numeric(12,2) AS total_revenue, COALESCE(AVG(valor_pago),0)::numeric(12,2) AS avg_ticket
FROM vendas;

/*--------------------------------------------------------------------------------------------------------------------*/


SELECT 
    TO_CHAR(data_venda, 'DD/MM') AS dia,
    COUNT(*) AS total
FROM vendas
WHERE data_venda >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY TO_CHAR(data_venda, 'DD/MM')
ORDER BY MIN(data_venda);

/*---------------------------------------------------------------------------------------------------------------------*/

SELECT 
    ve.nome AS modelo,
    COUNT(*) AS total
FROM vendas v
JOIN (
    SELECT DISTINCT id_veiculos, nome
    FROM veiculos
) ve ON ve.id_veiculos = v.id_veiculos
GROUP BY ve.nome
ORDER BY total DESC
LIMIT 5;














