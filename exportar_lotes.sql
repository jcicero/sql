SELECT
  created_at
  ,updated_at
  ,lote
  ,validade
  ,qtd
  ,id as produto_entrada_id
  ,null as produto_saida_id
  ,produto_id
FROM
  produto_entradas
WHERE
  estoque_id = 5
  and deleted_at is NULL ;


SELECT
   created_at
  ,updated_at
  ,obs as lote
  ,null as validade
  ,qtd * -1 as qtd
  ,null as produto_entrada_id
  ,id as produto_saida_id
  ,produto_id
FROM
  produto_saidas
WHERE
  estoque_id = 5
  and deleted_at is NULL;

select * from lotes order by lote