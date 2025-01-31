create or replace TRIGGER CMDKLTD_GLASGOWN_TR
before insert or update on CMDKLTD_GLASGOW_NEW
for each row
declare
	sql_w       varchar2(800);
	qt_result_w number;
	ds_erro_w   varchar2(2000);
	ds_exec_w   varchar2(2000);
	ie_abertura number;
	ie_reat_pupilar number;
	ie_resposta_motora number;
	ie_resposta_verbal number;
 
begin
	begin 
		if (wheb_usuario_pck.get_ie_executar_trigger = 'S') then
			if	((:new.NR_SEQUENCIA is not null or :old.NR_SEQUENCIA is not null)) then
 
				--INICIO
                
				ie_abertura         := nvl(:new.ie_abertura,0);
				ie_reat_pupilar     := nvl(:new.ie_reat_pupilar,0);
				ie_resposta_motora  := nvl(:new.ie_resposta_motora,0);
				ie_resposta_verbal  := nvl(:new.ie_resposta_verbal,0);
                
				qt_result_w := (ie_abertura + ie_resposta_verbal + ie_resposta_motora  -  ie_reat_pupilar);
                
				--FIM
			end if; 
		end if;
	exception
		when others then 
			qt_result_w := null;
			ds_erro_w := sqlerrm;
		end;
        
		:new.nr_score := qt_result_w;
end;
/
