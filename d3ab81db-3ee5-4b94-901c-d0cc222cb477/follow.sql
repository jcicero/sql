select
  follow.maiordata,
  follow.processo_id,
  setors.sigla
from
  follow_processos
 INNER JOIN
  (SELECT follow_processos.processo_id, MAX(follow_processos.data) as maiordata FROM follow_processos GROUP BY follow_processos.processo_id) as follow
    ON follow_processos.processo_id = follow.processo_id
      and follow_processos.data = follow.maiordata
LEFT JOIN setors ON follow_processos.setor_id = setors.id where setors.arquivo = 1;


select
  follow.maiordata,
  follow.processo_id,
  setors.sigla
from
  processos
LEFT JOIN follow_processos ON processos.id = follow_processos.processo_id
 INNER JOIN
  (SELECT follow_processos.processo_id, MAX(follow_processos.data) as maiordata FROM follow_processos GROUP BY follow_processos.processo_id) as follow
    ON follow_processos.processo_id = follow.processo_id
      and follow_processos.data = follow.maiordata
LEFT JOIN setors ON follow_processos.setor_id = setors.id where setors.arquivo = 1;


select * from vw_processos_arquivo;

select version();