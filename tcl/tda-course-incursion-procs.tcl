ad_library {
    Procedures in the evalutask record  namespace.
    
    @creation-date Feb 2019
    @author Jose Vega Alvaradoa

}

namespace eval incl {}


ad_proc -public incl::get_sedes {
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_list_of_lists get_sedes_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_sede [lindex $elemento 0]
        set select_json "$select_json $json_comma \{
                    \"nombre_sede\": $nombre_sede\"
            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json
}

ad_proc -public incl::get_escuelas {
    -sede_id
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_list_of_lists get_escuelas_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_escuela [lindex $elemento 0]
        set select_json "$select_json $json_comma \{
                    \"nombre_escuela\": $nombre_escuela\"
            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json
}

ad_proc -public incl::get_cursos {
    -escuela_id
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_list_of_lists get_cursos_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_curso [lindex $elemento 0]
        set select_json "$select_json $json_comma \{
                    \"nombre_curso\": $nombre_curso\"
            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json
}

ad_proc -public incl::get_grupos {
    -curso_id
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_list_of_lists get_grupos_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set numero_grupo [lindex $elemento 0]
        set select_json "$select_json $json_comma \{
                    \"numero_grupo\": $numero_grupo\"
            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json
}



ad_proc -public incl::get_sede_id {
    -nombre_sede
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_string get_sede_id_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return $result
}

ad_proc -public incl::get_escuela_id {
    -sede_id
    -escuela_nombre
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_string get_escuela_id_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return $result
}

ad_proc -public incl::get_curso_id {
    -escuela_id
    -curso_nombre
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_string get_cruso_id_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return $result
}

ad_proc -public incl::get_grupo_id {
    -curso_id
    -numero_grupo
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_string get_grupo_id_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return $result
}

ad_proc -public incl::insert_inclusion{
    -id_estudiante
    -id_grupo
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch {[db_dml insert_inclusion_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::get_inclusiones_estudiante{
    -id_estudiante
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [db_list_of_lists get_inclusiones_estudiante_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_curso [lindex $elemento 0]
        set numero_grupo [lindex $elemento 1]
        set id_estudiante [lindex $elemento 2]
        set select_json "$select_json $json_comma \{
                    \"nombre_curso\": $nombre_curso,
                    \"numero_grupo\": $numero_grupo,
                    \"id_estudiante\": $id_estudiante\"

            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json

}
ad_proc -public incl::insert_comentario{
    -asunto
    -mensaje
    -id_estudiante
    -id_escuela
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch {[db_dml insert_comentario_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::get_comentario_escuela{
    -id_escuela
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch {[db_list_of_lists get_comentario_escuela_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
        foreach elemento $result {
        set asunto [lindex $elemento 0]
        set mensaje [lindex $elemento 1]
        set escuela [lindex $elemento 2]
        set id_estudiante [lindex $elemento 3]
        set id_comentario [lindex $elemento 4]
        set select_json "$select_json $json_comma \{
                    \"asunto\": $asunto,
                    \"mensaje\": $mensaje,
                    \"escuela\": $escuela,
                    \"id_estudiante\": $id_estudiante,
                    \"id_comentario\": $id_comentario\"

            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json
}































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
