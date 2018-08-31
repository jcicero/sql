select
       p.codigo,
       concat(p.produto, ' - ',p.unidade) as medicamento,
       count(ps.produto_id) as pedidos
  from
    produtos as p
    left join produto_saidas as ps on p.id = ps.produto_id
    LEFT JOIN pedidos p2 on ps.pedido_id = p2.id
where
    ps.estoque_id = 4
  and p2.tipopedido = 'unidade'
group by
   ps.produto_id,
   p.codigo,
   p.produto,
   p.unidade
order by
   count(ps.produto_id)
desc;

