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
  and p.id NOT IN (select ps.produto_id from produto_saidas as ps where ps.created_at between '2018-06-01' and '2018-08-31')
  and p.id IN (select pe.produto_id from produto_entradas as pe where pe.created_at between '2018-01-01' and '2018-05-01')
group by p.id
order by p.produto;

select
       p.codigo,
       p.produto,
       max(DATE_FORMAT(ps.created_at, '%d/%m/%Y')) as ultima_data,
       sum(l.qtd) as saldo,
       sum(d.qtd) as ano
from produto_saidas as ps
  left join produtos p on ps.produto_id = p.id
  left join lotes l on p.id = l.produto_id
  left join demandas d on p.id = d.produto_id
    where ps.produto_id in
(198,
201,
217,
1242,
227,
231,
252,
258,
265,
320,
334,
337,
343,
346,
353,
357,
373,
395,
407,
414,
415,
423,
425,
433,
434,
442,
1266,
452,
458,
459,
461,
472,
484,
495,
513,
517,
1899,
537,
538,
559,
560,
561,
575,
577)
group by ps.produto_id,p.codigo, p.produto
order by p.produto