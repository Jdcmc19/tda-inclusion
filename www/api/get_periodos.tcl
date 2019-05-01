ad_page_contract {
	inclusiones API
	@author juan_jop96@hotmail.com
	@creation-date Mar 2019
} {
	{modalidad_id ""}
}


set answer [incl::get_periodos -modalidad_id $modalidad_id]

if {$answer eq -1} {
    set answer "\{\"title\":\"Bad Request\",\"body\":\"Problem to get admin page.\"\}"
    ns_return 400 "application/json; charset=utf-8" $answer
    ad_script_abort
}

ns_return 200 "application/json; charset=utf-8" $answer
ad_script_abort