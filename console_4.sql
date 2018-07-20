#SETORES
select s.setor, s.sigla from setors as s where s.deleted_at is null;

#FORNECEDORES
select e.nome, e.cnpj,e.email,e.telefone,e.endereco,e.area as obs,e.responsavel from empresas as e;

#UNIDADES DE MEDIDA
select distinct(p.unidade) from produtos as p order by p.unidade;

#CATEGORIAS
select c.descricao from categorias as c;

#PRODUTOS
select p.produto,p.unidade,c.descricao,p.lote,p.validade from produtos as p
left join categorias c on p.categoria_id = c.id
left join produto_estoques e on p.id = e.produto_id
where e.estoque_id > 1 and p.deleted_at is null;

#INVENTARIO
select p.produto,l.lote,l.validade,l.qtd from lotes as l
left join produtos p on l.produto_id = p.id
where l.qtd > 0
      and l.lote is not null
      and p.deleted_at is null
      and p.categoria_id not in (1,2,3);


