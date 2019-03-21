ad_page_contract {
	inclusiones API
	@author juan_jop96@hotmail.com sebaspf1997@gmail.com
	@creation-date Mar 2019
} {
	{id_escuela ""}
	{mensaje ""}
	{asunto  ""}
}


set answer [incl::insert_comentario -asunto $asunto -mensaje $mensaje -id_escuela $id_escuela]

if {$answer eq -1} {
    set answer "\{\"title\":\"Bad Request\",\"body\":\"Problem to get admin page.\"\}"
    ns_return 400 "application/json; charset=utf-8" $answer
    ad_script_abort
}

ns_return 200 "application/json; charset=utf-8" $answer
ad_script_abort