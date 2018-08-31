select
 # p.id
  p.codigo
  ,p.produto
  ,p.unidade
from
  produtos as p
  inner join produto_estoques e on p.id = e.produto_id
  left join produto_saidas as psai on p.id = psai.produto_id
where e.estoque_id = 4
  and p.id NOT IN (select ps.produto_id from produto_saidas as ps where ps.created_at between '2018-06-01' and '2018-08-20')
  and p.id IN (select pe.produto_id from produto_entradas as pe where pe.created_at between '2018-01-01' and '2018-05-01')
group by p.id
order by p.produto;