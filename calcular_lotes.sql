select
  p.codigo as codigo
  ,p.id as produto_id
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
    pe.estoque_id = 5
  and p.deleted_at IS NULL
  #  and l.produto_id = 340
   and codigo in (10990)
group by
  l.lote
  ,l.produto_id
  ,p.produto
ORDER BY l.lote;

SELECT * from lotes WHERE lote = '1648854'

select * from produtos where id = 1906
