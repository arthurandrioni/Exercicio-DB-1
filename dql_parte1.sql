1 -> SELECT id_cliente
    from fato_vendas
    WHERE id_cliente is null


2 -> SELECT COUNT(DISTINCT id_cliente)
    from fato_vendas


3 -> select SUM(valor_total)
    from fato_vendas
    WHERE data_venda >= '2025-01-01'


4 -> select DISTINCT marca, categoria
    from dim_produto
    WHERE categoria = 'Higiene'
    ORDER BY marca ASC


5 -> select ROUND(AVG(valor_total), 2) AS media_vendas
    from fato_vendas
    WHERE canal = 'Aplicativo'


6 -> select COUNT(categoria)
    from dim_produto
    WHERE categoria = 'Bebidas' AND preco_tabela > 10


7 -> select nome_produto, marca, preco_tabela
    FROM dim_produto
    ORDER BY preco_tabela DESC, nome_produto ASC
    LIMIT 1;


8 -> select categoria, COUNT(*)
    from dim_produto
    GROUP BY categoria
    ORDER BY COUNT(*) DESC, categoria ASC


9 -> SELECT categoria, AVG(preco_tabela)
    FROM dim_produto
    GROUP BY categoria
    ORDER BY AVG(preco_tabela) DESC


10 -> select cidade, COUNT(id_cliente) AS clientes
    from dim_cliente
    group by cidade
    HAVING COUNT(id_cliente) > 60
    ORDER BY cidade ASC


11- select COUNT(id_cliente)
    from dim_cliente
    WHERE email IS NULL


12- select count(id_cliente)
    from dim_cliente
    WHERE sexo ='F' AND data_nascimento BETWEEN '01-01-1990' AND '31-12-1999'



13- select COUNT(nome)
    from dim_cliente
    WHERE nome LIKE 'Ana%'


14- select uf, COUNT(id_loja)
    from dim_loja
    GROUP BY uf
    HAVING COUNT(id_loja) > 3
    ORDER BY COUNT(id_loja) DESC


15- select nome_loja, cidade, data_inauguracao
    from dim_loja
    WHERE data_inauguracao < '01-01-2007'
    ORDER BY data_inauguracao ASC


16- select canal,
    SUM(valor_total),
    COUNT(canal)
    from fato_vendas
    WHERE data_venda BETWEEN '2024-12-31' AND '2026-01-01'
    GROUP BY canal
    ORDER BY SUM(valor_total) DESC


17- select forma_pagamento, 
    COUNT(id_venda) as linhas_venda,
    SUM(valor_total) as faturamento
    from fato_vendas
    GROUP BY forma_pagamento
    ORDER BY SUM(valor_total) DESC


18- select id_produto,
    SUM(quantidade)
    from fato_vendas
    GROUP BY id_produto
    ORDER BY SUM(quantidade) DESC, id_produto ASC
    LIMIT 10;


19- select id_loja,
    SUM(valor_total)
    from fato_vendas
	WHERE data_venda BETWEEN '2023-12-31' AND '2025-01-01'
    GROUP BY id_loja
	ORDER BY SUM(valor_total) DESC


20 - select id_loja,
    COUNT(id_venda)
    from fato_vendas
    GROUP BY id_loja
	HAVING COUNT(id_venda) > 300
	ORDER BY COUNT(id_venda) DESC


21- select id_cliente,
    COUNT(id_venda)
    from fato_vendas
	WHERE id_cliente IS NOT NULL
    GROUP BY id_cliente
	HAVING COUNT(id_venda) > 70
	ORDER BY COUNT(id_venda) DESC, id_cliente ASC


22- select
    COUNT(id_venda),
	ROUND(AVG(desconto), 2)
    from fato_vendas
	WHERE desconto > 0



23- select
	MIN(valor_total) AS menor_valor,
	MAX(valor_total) AS maior_valor
	FROM fato_vendas
	WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31'

24 - select
	COUNT(id_venda),
	SUM(valor_total)
	FROM fato_vendas
	WHERE data_venda = '2025-12-24' 


25 - select
	id_venda,
	quantidade * preco_unitario AS valor_bruto,
	desconto,
	valor_total,
	ROUND(desconto / (quantidade * preco_unitario) * 100, 2) AS percen
	FROM fato_vendas
	WHERE canal = 'Site' AND data_venda BETWEEN '2025-01-01' AND '2025-12-31' AND desconto > 0
	ORDER BY percen DESC, id_venda ASC
	LIMIT 10