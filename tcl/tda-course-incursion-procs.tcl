ad_library {    
    Procedures in the evalutask record  namespace.
    
    @creation-date Feb 2019
    @author Jose Vega Alvaradoa

}

namespace eval incl {}

ad_proc -public incl::get_modalidades {
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name aDARconsulta -ws_type obtenerModalidades -ws_parameters ""] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_modalidad [lindex $elemento 0]
        set id_modalidad [lindex $elemento 1]
        set select_json "$select_json $json_comma \{
                    \"id_modalidad\": \"$id_modalidad\",
                    \"nombre_modalidad\": \"$nombre_modalidad\"
            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"



    return $select_json
}

ad_proc -public incl::get_periodos {

    -modalidad_id

} {
    @author Jose Daniel Vega Alvarado
} {

    if { [ catch { set result [ info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name aDARconsulta -ws_type obtenerPeriodos -ws_parameters $modalidad_id ] } errmsg ] } {
        
        puts "$errmsg" 
        return -1
    
    }  

    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        
        set nombre_periodo [ lindex $elemento 0 ]
        set id_periodo [ lindex $elemento 1 ]
        
        set select_json "$select_json $json_comma \{
                    \"id_periodo\": \"$id_periodo\",
                    \"nombre_periodo\": \"$nombre_periodo\"
            \}"
        set json_comma ","
    }

    set select_json "$select_json\]"

    return $select_json
}


ad_proc -public incl::get_sedes {
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name aDARconsulta -ws_type obtenerSedes -ws_parameters ""] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_sede [lindex $elemento 0]
        set id_sede [lindex $elemento 1]
        set select_json "$select_json $json_comma \{
                    \"id_sede\": \"$id_sede\",
                    \"nombre_sede\": \"$nombre_sede\"
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

    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name aDARconsulta -ws_type obtenerDepartamentos -ws_parameters $sede_id] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set nombre_escuela [lindex $elemento 0]
        set id_escuela [lindex $elemento 1]
        set select_json "$select_json $json_comma \{
                    \"id_escuela\": \"$id_escuela\",
                    \"nombre_escuela\": \"$nombre_escuela\"
            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    puts $select_json

    return $select_json
}

ad_proc -public incl::get_cursos {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
} {
    @author Jose Daniel Vega Alvarado
} {
    
    if { [ catch { set result [ info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "2019/$modalidad_id/$periodo_id/$escuela_id/$sede_id/null/null" ] } errmsg ] } {
        
        puts "$errmsg" 
        return -1

    }  

    set courses_id {}
    puts "esta es la modalidad $modalidad_id"
    puts "est e es el periodo $periodo_id"
    puts "est e es el sede $sede_id"
    puts "est e es el escuela_id $escuela_id"

    set select_json "\["
    set json_comma ""


    foreach item $result {

        set nombre [ lindex $item 19 ] 
        set identificador [ lindex $item 17 ]

        if { [ lsearch $courses_id $identificador ] eq -1} {
            set courses_id [ lappend courses_id $identificador ]

            set select_json "$select_json $json_comma \{
                        \"id_curso\": \"$identificador\",
                        \"nombre_curso\": \"$nombre\"
                \}"
            set json_comma ","            

        }
    }

    set select_json "$select_json\]"


    return $select_json
}

ad_proc -public incl::get_grupos {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "2019/$modalidad_id/$periodo_id/$escuela_id/$sede_id/$curso_id/null"] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    set groups_id {}

    set select_json "\["
    set json_comma ""


    foreach item $result {
        
        set numero [ lindex $item 25 ]


        if { [ lsearch $groups_id $numero ] eq -1} {
            set groups_id [ lappend groups_id $numero ]

            set select_json "$select_json $json_comma \{
                        \"id_grupo\": \"$numero\",
                        \"numero_grupo\": \"$numero\"
                \}"
            set json_comma ","            

        }
    }

    set select_json "$select_json\]"



    return $select_json
}

ad_proc -public incl::get_infoGroup {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {
    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "2019/$modalidad_id/$periodo_id/$escuela_id/$sede_id/$curso_id/null"] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  


    set select_json "\["
    set json_comma ""


    foreach item $result {
        
        set numero [ lindex $item 25 ]

        set nombre_profesor [ lindex $item 45 ]
        set nombre_dia [ lindex $item 49 ]
        set horario_entrada [ lindex $item 55 ]
        set horario_salida [ lindex $item 57 ]
        set edificio_dia [ lindex $item 51 ]
        set aula_dia [ lindex $item 53 ]


        puts "este es el número $numero y este grupo $grupo_id"

        if { $numero == $grupo_id } {

            set select_json "$select_json $json_comma \{
                        \"nombre_profesor\": \"$nombre_profesor\",
                        \"horario\": \"$nombre_dia : $horario_entrada - $horario_salida\",
                        \"edificio_aula\": \"$edificio_dia - $aula_dia\"
                \}"
            set json_comma ","

        }
    }

    set select_json "$select_json\]"

    puts $select_json



    return $select_json
}


#NO SE USARÁ CREO, PERO DEJAR AQUI POR SI ACASO
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
#NO SE USARÁ CREO, PERO DEJAR AQUI POR SI ACASO
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
#NO SE USARÁ CREO, PERO DEJAR AQUI POR SI ACASO
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
#NO SE USARÁ CREO, PERO DEJAR AQUI POR SI ACASO
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

ad_proc -public incl::insert_inclusion {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
    -comentario_asunto
    -comentario_mensaje
} {
    @author Jose Daniel Vega Alvarado
} {
    set user_id [ad_conn user_id]
    set anno_id = 2019


    if {[catch { db_dml insert_inclusion_query {} } errmsg] } {
        puts "-----------------------------   $errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::get_inclusiones_estudiante {
} {
    @author Jose Daniel Vega Alvarado
} {
    set id_estudiante [ad_conn user_id]

    if {[catch { set result [db_list_of_lists get_inclusiones_estudiante_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set sede_nombre [lindex $elemento 0]
        set escuela_nombre [lindex $elemento 1]
        set curso_nombre [lindex $elemento 2]
        set grupo_numero [lindex $elemento 3]
        set estado [lindex $elemento 4]
        ##set carnet_estudiante [td_estudiante::obtener_carnet_estudiante -user_id $user_id]
        ##set nombre_estudiante [prematricula::get_name_students $carnet_estudiante]

        ##set nombres_estudiante [lindex $nombres_estudiante 1]
        ##set apellidos_estudiante [lindex $nombres_estudiante 2]
        set select_json "$select_json $json_comma \{
                    \"sede_nombre\": \"$sede_nombre\",
                    \"escuela_nombre\": \" $escuela_nombre \",
                    \"curso_nombre\":  \"$curso_nombre \",
                    \"grupo_numero\": $grupo_numero,
                    \"estado\": \"$estado\"

            \}"
        set json_comma ","
    }
    set select_json "$select_json\]"

    return $select_json

}
ad_proc -public incl::insert_comentario {
    -asunto
    -mensaje
    -id_escuela
} {
    @author Jose Daniel Vega Alvarado
} {
    set id_estudiante [ad_conn user_id]
    if {[catch {db_dml insert_comentario_query {} } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::get_comentario_escuela {
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
