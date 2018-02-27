select
  l.produto_id
  ,p.produto
  ,l.lote
  ,sum(l.qtd) saldo
from
  produtos p
  left JOIN lotes l ON p.id = l.produto_id
  WHERE l.produto_id = 218
group by
  l.lote
  ,l.produto_id
  ,p.produto
ORDER BY p.produto

SELECT * from lotes WHERE produto_id = 218