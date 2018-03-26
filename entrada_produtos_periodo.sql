SELECT
  empresas.nome as FORNECEDOR
  ,date_format(entradas.dataentrada,'%d/%m/%Y') as DATA_ENTRADA
  ,entradas.numeroentrada as NUMERO_DOC
 # ,entradas.tipoentrada AS TIPO
  ,produtos.codigo AS CODIGO
  ,concat(produtos.produto, ' - ',produtos.unidade) as PRODUTO
  ,sum(entrada.qtd) AS qtd
FROM
  entradas
  LEFT JOIN empresas ON entradas.empresa_id = empresas.id
  LEFT JOIN produto_entradas AS entrada ON entradas.id = entrada.entrada_id
  LEFT JOIN produtos ON entrada.produto_id = produtos.id
WHERE
  entrada.estoque_id = 4
  AND entradas.dataentrada BETWEEN '2018-03-19' AND '2018-03-26'
  AND entradas.tipoentrada <> 'inventario'
GROUP BY
   produtos.codigo
  ,produtos.unidade
  ,produtos.produto
  ,entradas.numeroentrada
 # ,entradas.tipoentrada
  ,entradas.dataentrada
  ,empresas.nome
ORDER BY
  entradas.dataentrada;