select
  e.item
  ,e.itemcatlogo
  ,e.cod
  ,e.produto
#   ,p.produto
  ,l.lote
  ,DATE_FORMAT(l.validade, '%d/%m/%Y') as validade
  ,l.qtd
from
  emergencials as e
  left join produtos as p on e.cod = p.codigo
  left join lotes l on p.id = l.produto_id
  left join produto_estoques e2 on p.id = e2.produto_id
  where p.deleted_at is null
  and l.qtd > 0
  or l.qtd is null
  and e2.estoque_id = 4
  or e2.estoque_id is null
order by e.produto;

select
  e.item
  ,e.itemcatlogo
  ,e.cod
  ,e.produto
  ,p.produto as produto_sistema
  ,l.qtd
  ,l.lote
  ,DATE_FORMAT(l.validade, '%d/%m/%Y') as validade
  ,e.categoria_id
from
  emergencials as e
  left join produtos as p on e.cod = p.codigo
  left join lotes l on p.id = l.produto_id
  #left join produto_estoques e2 on p.id = e2.produto_id
  where p.deleted_at is null
 #  and e.categoria_id = p.categoria_id
 #   and e.categoria_id = 6
#    and e2.estoque_id = 4 or e2.estoque_id is null
   and l.qtd > 0 or l.qtd is null
order by e.categoria_id, e.item;

