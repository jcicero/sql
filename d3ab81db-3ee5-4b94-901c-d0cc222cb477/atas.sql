select
  a.arp,
  a.vigencia,
  a.pls,
  p.nr_processo,
  o.objeto,
  ia.itemarp,
  ia.descdoe,
  ia.qtdreg
#   sum(ip.qtd) as qtp_proc
  from atas a
LEFT JOIN processos as p ON a.id = p.ata_id
LEFT JOIN objetos as o ON a.objeto_id = o.id
    LEFT JOIN item_atas as ia ON a.id = ia.ata_id
#     LEFT JOIN item_processos as ip ON ia.id = ip.item_ata_id
    where a.pls like '%/2016'
GROUP BY
    a.arp,
  a.vigencia,
  a.pls,
  p.nr_processo,
  o.objeto,
  ia.descdoe,
  ia.qtdreg,
  ia.itemarp;