SELECT
produtos.codigo
  ,produtos.produto
  ,produtos.unidade
  ,sum(saida.qtd) AS qtd
FROM
  pedidos
  LEFT JOIN produto_saidas AS saida ON pedidos.id = saida.pedido_id
  LEFT JOIN produtos ON saida.produto_id = produtos.id
WHERE
  pedidos.setor_id = 7
  AND pedidos.estoque_id = 4
  AND pedidos.datapedido BETWEEN '2018-03-01' AND '2018-03-22'
GROUP BY
  produtos.codigo
  ,produtos.unidade
  ,produtos.produto
ORDER BY
  produtos.produto
