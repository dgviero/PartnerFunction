create or replace function CMDKLTD_CALCULA_GLAGLOW_N (
  ie_abertura_p in number,
  ie_reat_pupilar_p in number,
  ie_resposta_motora_p in number,
  ie_resposta_verbal_p in number
) return number
is
begin
  return nvl(ie_abertura_p, 0) + 
	nvl(ie_resposta_verbal_p, 0) + 
	nvl(ie_resposta_motora_p, 0) - 
	nvl(ie_reat_pupilar_p, 0);
end;
/
