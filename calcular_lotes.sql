select
  p.codigo as codigo
  ,p.produto as descricao
  ,l.lote
  ,date_format(l.validade,'%d/%m/%Y') as validade
  ,sum(l.qtd) as saldo
  ,'' as contagem
  ,'' as recontagem
from
  produtos p
  left JOIN lotes l ON p.id = l.produto_id
  LEFT JOIN produto_estoques pe ON p.id = pe.produto_id
  WHERE
    pe.estoque_id = 4
  and p.deleted_at IS NULL
  #  and l.produto_id = 340
group by
  l.lote
  ,l.produto_id
  ,p.produto
ORDER BY p.produto;

SELECT * from lotes WHERE produto_id = 218
