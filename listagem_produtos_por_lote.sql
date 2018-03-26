SELECT
  p.codigo
  ,p.produto
  ,p.unidade
  ,pe.lote
 # ,pe.qtd
 # ,ps.obs
 # ,ps.qtd as qtdsaida
  ,(pe.qtd - ps.qtd) as saldo
FROM
  produtos  as p
  LEFT JOIN produto_entradas as pe ON p.id = pe.produto_id
  LEFT JOIN produto_saidas as ps ON p.id = ps.produto_id
WHERE
  pe.estoque_id = 4
  #and p.codigo = 9475
 # and pe.lote = ps.obs
GROUP BY
  p.codigo
  ,p.produto
  ,p.unidade
  ,pe.lote
 # ,pe.qtd
 # ,ps.obs
 # ,ps.qtd
ORDER BY
  p.produto;