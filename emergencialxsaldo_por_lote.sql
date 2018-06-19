select
  e.item
  ,e.itemcatlogo
  ,e.cod
  ,e.produto
  ,l.lote
  ,DATE_FORMAT(l.validade, '%m/%Y') as validade
  ,l.qtd
from
  emergencials as e
left join produtos as p on e.cod = p.codigo
  left join lotes as l on p.id = l.produto_id
where p.categoria_id = 6
  and l.qtd > 0
order by e.item;