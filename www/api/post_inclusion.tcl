ad_page_contract {
	inclusiones API
	@author juan_jop96@hotmail.com sebaspf1997@gmail.com
	@creation-date Mar 2019
} {
	{modalidad_id ""}
	{periodo_id ""}
	{sede_id ""}
	{escuela_id ""}
	{curso_id ""}
	{modalidad_nombre ""}
	{sede_nombre ""}
	{escuela_nombre ""}
	{curso_nombre ""}
	{grupo_id ""}
	{comentario_asunto ""}
	{comentario_mensaje ""}

}


set answer [incl::insert_inclusion -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -modalidad_nombre $modalidad_nombre -sede_nombre $sede_nombre -escuela_nombre $escuela_nombre -curso_nombre $curso_nombre -grupo_id $grupo_id -comentario_asunto $comentario_asunto -comentario_mensaje $comentario_mensaje]

if {$answer eq -1} {
    set answer "\{\"title\":\"Bad Request\",\"body\":\"Problem to get admin page.\"\}"
    ns_return 400 "application/json; charset=utf-8" $answer
    ad_script_abort
}

ns_return 200 "application/json; charset=utf-8" $answer
ad_script_abort