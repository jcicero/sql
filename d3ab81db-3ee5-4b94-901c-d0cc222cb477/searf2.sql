CREATE OR REPLACE VIEW vw_arquivados AS
SELECT
  `jcadm247_siscarp`.`processos`.`nr_processo`                                            AS `processo`,
  `jcadm247_siscarp`.`processos`.`id`                                                     AS `processo_id`,
  `jcadm247_siscarp`.`processos`.`dataprocesso`                                           AS `dataprocesso`,
  `jcadm247_siscarp`.`atas`.`arp`                                                         AS `arp`,
  `jcadm247_siscarp`.`atas`.`id`                                                          AS `ata_id`,
  `jcadm247_siscarp`.`atas`.`vigencia`                                                    AS `vigencia`,
  `jcadm247_siscarp`.`objetos`.`objeto`                                                   AS `objeto`,
  `jcadm247_siscarp`.`objetos`.`id`                                                       AS `objetos_id`,
  `jcadm247_siscarp`.`item_processos`.`id`                                                AS `itemproc_id`,
  `jcadm247_siscarp`.`item_atas`.`precoreg`                                               AS `precoreg`,
  `jcadm247_siscarp`.`item_processos`.`qtd`                                               AS `qtdprocesso`,
  (`jcadm247_siscarp`.`item_processos`.`qtd` * `jcadm247_siscarp`.`item_atas`.`precoreg`) AS `valorprocesso`,
  setors.sigla                                                                            AS 'sigla',
  follow_processos.data                                                                   AS 'datamov',
  sum(`jcadm247_siscarp`.`empenhos`.`vl_empenho`)                                         AS `empenho`
FROM ((((((`jcadm247_siscarp`.`processos`
  JOIN `jcadm247_siscarp`.`item_processos` ON ((`jcadm247_siscarp`.`processos`.`id` = `jcadm247_siscarp`.`item_processos`.`processo_id`)))
  JOIN `jcadm247_siscarp`.`item_atas` ON ((`jcadm247_siscarp`.`item_processos`.`item_ata_id` = `jcadm247_siscarp`.`item_atas`.`id`)))
  JOIN `jcadm247_siscarp`.`items` ON ((`jcadm247_siscarp`.`item_atas`.`item_id` = `jcadm247_siscarp`.`items`.`id`)))
  JOIN `jcadm247_siscarp`.`atas` ON ((`jcadm247_siscarp`.`processos`.`ata_id` = `jcadm247_siscarp`.`atas`.`id`)))
  JOIN `jcadm247_siscarp`.`objetos` ON ((`jcadm247_siscarp`.`atas`.`objeto_id` = `jcadm247_siscarp`.`objetos`.`id`)))
  LEFT JOIN `jcadm247_siscarp`.`empenhos` ON ((`jcadm247_siscarp`.`processos`.`id` = `jcadm247_siscarp`.`empenhos`.`processo_id`)))
LEFT JOIN follow_processos ON processos.id = follow_processos.processo_id
#  INNER JOIN
#   (SELECT follow_processos.processo_id, MAX(follow_processos.data) as maiordata FROM follow_processos GROUP BY follow_processos.processo_id) as follow
#     ON follow_processos.processo_id = follow.processo_id
#       and follow_processos.data = follow.maiordata
LEFT JOIN setors ON follow_processos.setor_id = setors.id
WHERE (`jcadm247_siscarp`.`item_processos`.`qtd` > '0')
#       and setors.arquivo = 1
GROUP BY `jcadm247_siscarp`.`processos`.`nr_processo`, `jcadm247_siscarp`.`processos`.`id`,
  `jcadm247_siscarp`.`processos`.`dataprocesso`, `jcadm247_siscarp`.`atas`.`arp`, `jcadm247_siscarp`.`atas`.`id`,
  `jcadm247_siscarp`.`atas`.`vigencia`, `jcadm247_siscarp`.`objetos`.`objeto`, `jcadm247_siscarp`.`objetos`.`id`,
  `jcadm247_siscarp`.`item_processos`.`id`, setors.sigla, follow_processos.data
#     having max(follow_processos.created_at)
ORDER BY `jcadm247_siscarp`.`processos`.`dataprocesso` DESC;


select processo, max(datamov) from vw_arquivados where sigla = 'SEARF' GROUP BY processo;

select
  a.processo,
  a.sigla,
  a.datamov,
  a.processo_id,
  a.arp,
  a.ata_id,
  a.vigencia,
  a.objeto,
  a.objetos_id,
#   a.itemproc_id,
  a.precoreg,
  sum(a.qtdprocesso) as qtdprocesso,
  sum(a.valorprocesso) as valorprocesso,
  sum(a.empenho) as empenho
from vw_arquivados as a
inner join
(select max(datamov) as datamov, processo
from vw_arquivados
group by processo
) as b
on (a.processo=b.processo and a.datamov=b.datamov)
where a.sigla = 'SEARF'
GROUP BY
#   a.processo,a.sigla,a.datamov;
  a.processo,
  a.sigla,
  a.datamov,
  a.processo_id,
  a.arp,
  a.ata_id,
  a.vigencia,
  a.objeto,
  a.objetos_id,
  a.precoreg;
