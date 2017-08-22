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