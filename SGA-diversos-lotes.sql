select
*
from produto_saidas
where obs is not null;

select * from produto_entradas where produto_id = 546;
select * from produto_saidas where produto_id = 546;

select * from lotes where produto_id = 546;

select
  produtos.produto
  ,lotes.lote
  ,lotes.validade
  ,lotes.qtd
from
  lotes
  left join produtos on lotes.produto_id = produtos.id
#where lotes.validade between '2018-04-01' and '2018-12-31'
  where lotes.qtd <> 0
order by produtos.produto;

select
  id as produto_id
  ,6 as estoque_id
from
  produtos
where categoria_id = 8;

select * from users