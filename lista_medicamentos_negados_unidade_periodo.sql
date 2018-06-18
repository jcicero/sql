select
   produtos.codigo as CODIGO
  ,concat(produtos.produto , ' - ', produtos.unidade) as PRODUTO
 # ,pedidos.requisicao
from
  pedidos
  left join estoques on pedidos.estoque_id = estoques.id
  left join produto_saidas as saida on pedidos.id = saida.pedido_id
  left join setors as s on pedidos.setor_id = s.id
  left join produtos on saida.produto_id = produtos.id
where saida.qtd = 0
    and pedidos.setor_id = 7 #informar o setor ou comentar para listar todos
    and estoques.id = 4 #informar o estoque (4 medicamentos)
    and pedidos.datapedido between '2018-04-22' and '2018-04-28' #informar período a ser pesquisado
group by
    produtos.codigo
    ,produtos.produto
    ,produtos.unidade
   # ,pedidos.requisicao
order by produtos.produto;

# 1 - HEPR
# 5 - MESM
# 7 - HEHA
# 14 - CAPSCV
# 15 - CERIII