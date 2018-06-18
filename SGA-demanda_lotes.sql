# UPDATE pedidos SET pedidos.tipopedido = 'unidade' WHERE pedidos.tipopedido is null;

select
  produtos.codigo,
  produtos.produto,
  sum(demandas.qtd) as demanda,
  sum(demandas.qtd / 12) as mensal,
  sum(produto_saidas.qtd) as saidas,
  sum(demandas.qtd - produto_saidas.qtd) as saldo
from
  demandas,
  produtos,
  produto_saidas
where
  demandas.produto_id = produtos.id
 and produto_saidas.produto_id = produtos.id
 and produto_saidas.setor_id = 7
group by
    produtos.codigo,
  produtos.produto;


SELECT count(*) FROM lotes WHERE lote is null and produto_id = 422 and qtd <> 0;

select * from lotes where lote = '';

select * from lotes where produto_id = 169;
select * from lotes where qtd <> 0;

select * from produto_saidas where produto_id = 422;
select * from produto_entradas where produto_id = 422;