ad_library {
    Procedures in the evalutask record  namespace.
    
    @creation-date Feb 2019
    @author Jose Vega Alvarado

}

namespace eval incl {}

ad_proc -public incl::insert_info {
	{-name "default"}
	-password
} {
	@author Jose Daniel Vega Alvarado
	@param user_id 

} {

	puts "parametros del procs"
	puts "name $name"
	puts "password $password"

    # if {[catch {db_dml insert_info_query {}} errmsg] } {
    #     return -1
    # }  

    set answer "\{\"title\":\"Success\",\"body\": \"ok!!\"\}"

    return $answer

}


ad_proc -public incl::get_info {

} {
	@author Jose Daniel Vega Alvarado
	@param user_id 

} {

    set user_id [ad_conn user_id]
    set carnet [td_estudiante::obtener_carnet_estudiante -user_id $user_id]


    if {[catch { set result [db_list_of_lists get_info_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  



    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set dependency_id [lindex $elemento 0]
        set name [lindex $elemento 1]


		set select_json "$select_json $json_comma \{
                    \"dependency_id\": $dependency_id,
                    \"carnet\": $carnet,
                    \"name\": \"$name\"
			\}"
        set json_comma ","
    }

    set select_json "$select_json\]"


    return $select_json

}