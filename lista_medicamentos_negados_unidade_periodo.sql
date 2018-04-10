select
   produtos.codigo
  ,concat(produtos.produto , ' - ', produtos.unidade) as produto
  ,s.setor
from
  pedidos
  left join estoques on pedidos.estoque_id = estoques.id
  left join produto_saidas as saida on pedidos.id = saida.pedido_id
  left join setors as s on pedidos.setor_id = s.id
  left join produtos on saida.produto_id = produtos.id
where saida.qtd = 0
    and pedidos.setor_id = 14 #informar o setor ou comentar para listar todos
    and estoques.id = 4 #informar o estoque
    and pedidos.datapedido between '2018-04-01' and '2018-04-30' #informar período a ser pesquisado
order by produtos.produto;