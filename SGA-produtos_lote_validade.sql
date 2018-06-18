select * from produto_entradas where produto_id = 546;
select * from produto_saidas where produto_id = 546;

select
  produtos.produto
  ,lotes.lote
  ,lotes.validade
from
  lotes
  left join produtos on lotes.produto_id = produtos.id
where lotes.validade between '2018-05-01' and '2018-05-30'