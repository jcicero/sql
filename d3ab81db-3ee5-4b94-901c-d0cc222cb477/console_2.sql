select
  max(follow_processos.data) as maiordata
  ,follow_processos.processo_id
  ,processos.nr_processo
  ,processos.dataprocesso
  ,atas.arp
  ,atas.vigencia
  ,atas.id
  ,objetos.objeto
#   ,item_processos.qtd
  ,sum(item_processos.qtd * item_atas.precoreg)  as total
#   ,item_atas.precoreg
  ,setors.sigla
from
  follow_processos
  ,processos
  ,item_processos
  ,setors
  ,atas
  ,item_atas
  ,objetos
where
  follow_processos.processo_id = 229
  and follow_processos.processo_id = processos.id
  and follow_processos.setor_id = setors.id
  and processos.ata_id = atas.id
  and setors.arquivo is NULL
  and processos.id = item_processos.processo_id
  and item_processos.item_ata_id = item_atas.id
  and item_processos.qtd > 0
  and atas.objeto_id = objetos.id
GROUP BY
  follow_processos.processo_id
  ,processos.nr_processo
  ,processos.dataprocesso
  ,atas.arp
  ,atas.vigencia
  ,atas.id
  ,objetos.objeto
#   ,item_atas.precoreg
#   ,item_processos.qtd
  ,setors.sigla