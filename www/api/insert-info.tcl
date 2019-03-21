ad_page_contract {
	task record API
	@author jvega@itcr.ac.cr
	@creation-date Feb 2019
} {
	{name ""}
	{password ""}
}


puts "parametros del intermediario"
puts "name $name"
puts "password $password"

set answer [incl::insert_info -name $name -password $password]

if {$answer eq -1} {
    set answer "\{\"title\":\"Bad Request\",\"body\":\"Problem to get admin page.\"\}"
    ns_return 400 "application/json; charset=utf-8" $answer
    ad_script_abort
}

ns_return 200 "application/json; charset=utf-8" $answer
ad_script_abort