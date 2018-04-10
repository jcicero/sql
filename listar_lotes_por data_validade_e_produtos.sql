SELECT
  produtos.codigo
  ,produtos.produto
  ,produtos.unidade
  ,pe.validade
  ,pe.lote
  ,'' AS qtd
FROM
  produtos
LEFT JOIN produto_entradas AS pe ON pe.produto_id = produtos.id
WHERE codigo in
        (9818,9490,9495,9524,9537,9568,9595,11280,9688,9841,12054,9919,12875,12923,9649)
  AND pe.validade = '2018-04-30'
GROUP BY
    produtos.codigo
  ,produtos.produto
  ,produtos.unidade
  ,pe.validade
  ,pe.lote;

SELECT
  produtos.codigo
  ,produtos.produto
  ,produtos.unidade
  ,'' AS lote
  ,'30/04/2018' AS validade
  ,'' AS qtd
FROM
  produtos
WHERE codigo in
        (9818,9490,9495,9524,9537,9568,9595,11280,9688,9841,12054,9919,12875,12923,9649)
