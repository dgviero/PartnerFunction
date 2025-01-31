create or replace function CMDKLTD_OBTER_RESULTADO_GLASGOW_N ( NR_SCORE_P in Number)
			return varchar2 is

ds_retorno_w		Varchar2(100);

begin
ds_retorno_w	:= '';

	if	(NR_SCORE_P <= 3) then
		ds_retorno_w := obter_desc_expressao(697360);
	elsif	(NR_SCORE_P between 3 and 8) then
		ds_retorno_w := obter_desc_expressao(487234);
	elsif	(NR_SCORE_P between 9 and 12) then
		ds_retorno_w := obter_desc_expressao(331188);
	elsif  (NR_SCORE_P between 13 and 15) then
		ds_retorno_w := obter_desc_expressao(331099);        
	end if;

return ds_retorno_w;

end CMDKLTD_OBTER_RESULTADO_GLASGOW_N;
/
