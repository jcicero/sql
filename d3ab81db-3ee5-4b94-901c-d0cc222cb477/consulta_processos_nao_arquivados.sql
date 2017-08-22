select
  max(follow_processos.data) as maiordata
  ,processos.id
  ,processos.nr_processo
  ,processos.dataprocesso
  ,atas.arp
  ,atas.vigencia
  ,atas.id
  ,objetos.objeto
#   ,item_processos.qtd
  ,sum(item_processos.qtd * item_atas.precoreg)  as total
  ,sum(item_empenhos.qtd * item_atas.precoreg) as empenho
#   ,item_atas.precoreg
#   ,setors.sigla
from
  processos
  LEFT JOIN follow_processos ON processos.id = follow_processos.processo_id
  INNER JOIN item_processos ON processos.id = item_processos.processo_id
  LEFT JOIN setors ON follow_processos.setor_id = setors.id
  INNER JOIN atas ON processos.ata_id = atas.id
  INNER JOIN item_atas ON item_processos.item_ata_id = item_atas.id
  INNER JOIN objetos ON atas.objeto_id = objetos.id
  LEFT JOIN empenhos ON processos.id = empenhos.processo_id
  LEFT JOIN item_empenhos ON empenhos.id = item_empenhos.empenho_id
where
  item_processos.qtd > 0
  and setors.arquivo is NULL
#   and follow_processos.processo_id = 230
#   and follow_processos.processo_id = processos.id
#   and follow_processos.setor_id = setors.id
#   and processos.ata_id = atas.id
#   and processos.id = item_processos.processo_id
#   and item_processos.item_ata_id = item_atas.id
#   and atas.objeto_id = objetos.id
GROUP BY
  processos.id
  ,processos.nr_processo
  ,processos.dataprocesso
  ,atas.arp
  ,atas.vigencia
  ,atas.id
  ,objetos.objeto
#   ,item_atas.precoreg
#   ,item_processos.qtd
#   ,setors.sigla
;



select
        max(follow_processos.data) as maiordata
        ,processos.id   as processo_id
        ,processos.nr_processo  as processo
        ,processos.dataprocesso
        ,atas.arp
        ,atas.vigencia
        ,atas.id as ata_id
        ,objetos.objeto
        ,sum(item_processos.qtd * item_atas.precoreg)  as valor
        ,sum(item_empenhos.qtd * item_atas.precoreg) as empenho
        ,(sum(item_processos.qtd * item_atas.precoreg) - sum(item_empenhos.qtd * item_atas.precoreg)) as saldo
      from
        processos
        LEFT JOIN follow_processos ON processos.id = follow_processos.processo_id
        INNER JOIN item_processos ON processos.id = item_processos.processo_id
        LEFT JOIN setors ON follow_processos.setor_id = setors.id
        INNER JOIN atas ON processos.ata_id = atas.id
        INNER JOIN item_atas ON item_processos.item_ata_id = item_atas.id
        INNER JOIN objetos ON atas.objeto_id = objetos.id
        LEFT JOIN empenhos ON processos.id = empenhos.processo_id
        LEFT JOIN item_empenhos ON empenhos.id = item_empenhos.empenho_id
        INNER JOIN
  (SELECT follow_processos.processo_id, MAX(follow_processos.data) as maiordata FROM follow_processos GROUP BY follow_processos.processo_id) as follow
    ON follow_processos.processo_id = follow.processo_id
      and follow_processos.data = follow.maiordata
      where
        item_processos.qtd > 0
        and setors.arquivo is NULL
#         and processos.id = 230
      GROUP BY
        processos.id
        ,processos.nr_processo
        ,processos.dataprocesso
        ,atas.arp
        ,atas.vigencia
        ,atas.id
        ,objetos.objeto
ORDER BY processos.dataprocesso DESC