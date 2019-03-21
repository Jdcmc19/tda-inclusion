ad_page_contract {
	inclusiones API
	@author juan_jop96@hotmail.com sebaspf1997@gmail.com
	@creation-date Mar 2019
} {
	user_id ""
	grupo ""
}


set answer [incl::post_inclusion -user_id $user_id  -grupo $grupo]

if {$answer eq -1} {
    set answer "\{\"title\":\"Bad Request\",\"body\":\"Problem to get admin page.\"\}"
    ns_return 400 "application/json; charset=utf-8" $answer
    ad_script_abort
}

ns_return 200 "application/json; charset=utf-8" $answer
ad_script_abort