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

ad_proc -public incl::get_guia_horarios {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
} {
    @author Jose Daniel Vega Alvarado
} {
    set anno_id [clock format [clock seconds] -format "%Y"]
    if { [ catch { set result [ info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "$anno_id/$modalidad_id/$periodo_id/$escuela_id/$sede_id/null/null" ] } errmsg ] } {
        
        puts "$errmsg" 
        return -1

    }  


    set select_json "\["
    set json_comma ""


    foreach item $result {

        set codigo_curso [ lindex $item 17 ] 
        set nombre_materia [ lindex $item 19 ]
        set numero_grupo [ lindex $item 25 ]
        set creditos_curso [ lindex $item 21 ] 
        set horario_grupo_entrada [ lindex $item 55 ]
        set horario_grupo_salida [ lindex $item 57 ]
        set horario_dia [ lindex $item 49 ]
        set nombre_profesor [ lindex $item 45 ]
        set tipo_materia [ lindex $item 37 ]
        set reservados [ lindex $item 31 ]

    
        set cupo [incl::get_cupo_grupo -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $nombre_materia -grupo_id $numero_grupo ]

        if { $cupo eq -1} {

            set matriculados_grupo [ lindex $item 27] 
            set campo_grupo [ lindex $item 29] 
            
            set cupo [ expr $campo_grupo - $matriculados_grupo]

        } else {

            set cupo [lindex $cupo 0]

        }
        

        set select_json "$select_json $json_comma \{
                    \"codigo_curso\": \"$codigo_curso\",
                    \"nombre_materia\": \"$nombre_materia\",
                    \"numero_grupo\": \"$numero_grupo\",
                    \"creditos_curso\": \"$creditos_curso\",
                    \"horario\": \"$horario_dia : $horario_grupo_entrada - $horario_grupo_salida\",
                    \"nombre_profesor\": \"$nombre_profesor\",
                    \"cupo\": \"$cupo\",
                    \"tipo_materia\": \"$tipo_materia\",
                    \"reservados\": \"$reservados\"
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
    set anno_id [clock format [clock seconds] -format "%Y"]
    if { [ catch { set result [ info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "$anno_id/$modalidad_id/$periodo_id/$escuela_id/$sede_id/null/null" ] } errmsg ] } {
        
        puts "$errmsg" 
        return -1

    }  

    set courses_id {}


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

ad_proc -public incl::existe_cerrado {

    -grupo_fk

} {
    @author Jose Daniel Vega Alvarado
} {


    if {[catch { db_string existe_cerrado_query {} } errmsg] } {
        return -1
    }  

    return 1
}

ad_proc -public incl::get_grupos {
    -modalidad_id
    -modalidad_nombre
    -periodo_id
    -sede_id
    -sede_nombre
    -escuela_id
    -escuela_nombre
    -curso_id
    -curso_nombre
} {
    @author Jose Daniel Vega Alvarado
} {
    set anno_id [clock format [clock seconds] -format "%Y"]

    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "$anno_id/$modalidad_id/$periodo_id/$escuela_id/$sede_id/$curso_id/null"] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  

    set groups_id {}

    set select_json "\["
    set json_comma ""


    foreach item $result {
        
        set numero [ lindex $item 25 ]





        if { [ lsearch $groups_id $numero ] eq -1} {


            set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_nombre $sede_nombre -escuela_nombre $escuela_nombre -curso_nombre $curso_nombre -grupo_id $numero ] 0]
            set cerradop [incl::existe_cerrado -grupo_fk $grupo_fk]

            puts "el grupofk es $grupo_fk y el cerradop es $cerradop  $modalidad_nombre $periodo_id $sede_nombre $escuela_nombre $curso_nombre"

            if { $cerradop eq -1 } {
                puts "entro aqui"

                set groups_id [ lappend groups_id $numero ]

                set select_json "$select_json $json_comma \{
                            \"id_grupo\": \"$numero\",
                            \"numero_grupo\": \"$numero\"
                    \}"
                set json_comma "," 

            }
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

    set anno_id [clock format [clock seconds] -format "%Y"]
    if {[catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "$anno_id/$modalidad_id/$periodo_id/$escuela_id/$sede_id/$curso_id/null"] } errmsg] } {
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

ad_proc -public incl::insert_grupo {
    -modalidad_id
    -modalidad_nombre
    -periodo_id
    -sede_id
    -sede_nombre
    -escuela_id
    -escuela_nombre
    -curso_id
    -curso_nombre
    -grupo_id

} {
    @author Jose Daniel Vega Alvarado
} {
    set anno_id [clock format [clock seconds] -format "%Y"]

    if { [ catch { set result [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type IESCCARGAGUIAHORARIOS_Buscar -ws_parameters "$anno_id/$modalidad_id/$periodo_id/$escuela_id/$sede_id/$curso_id/null"] } errmsg] } {
        
        puts "$errmsg" 
        return -1

    }  
    set cupo 100;

    puts "curso id es el -$curso_id-"

    foreach item $result {

        set numero [ lindex $item 25 ]


        if { $numero == $grupo_id } {

            puts "                                 holaaaa"

            set matriculados_grupo [ lindex $item 27 ] 
            set campo_grupo [ lindex $item 29 ] 

            puts "matriculados_grupo $matriculados_grupo y campo_grupo $campo_grupo"

            set current_cupo [ expr $campo_grupo - $matriculados_grupo ]      

            if { $cupo > $current_cupo } {

                set cupo $current_cupo

            }

        }


        
    }


    if {[catch { db_dml insert_grupo_query {} } errmsg] } {
        puts "-----------------------------   $errmsg" 
        return -1
    }  

    return 1
}


ad_proc -public incl::get_insert_id_grupo {
    -modalidad_id
    -modalidad_nombre
    -periodo_id
    -sede_id
    -sede_nombre
    -escuela_id
    -escuela_nombre
    -curso_id
    -curso_nombre
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set anno_id [clock format [clock seconds] -format "%Y"]
    if {[catch { set result [db_string get_insert_id_grupo_query {}] } errmsg] } {


        set answer [incl::insert_grupo -modalidad_id $modalidad_id -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_id $sede_id -sede_nombre $sede_nombre -escuela_id $escuela_id -escuela_nombre $escuela_nombre -curso_id $curso_id -curso_nombre $curso_nombre -grupo_id $grupo_id ]



        if { $answer eq 1} {

            if {[catch { set result [db_string get_insert_id_grupo_query {}] } errmsg] } {

                puts "$errmsg" 
                return -1

            } else {

                set select_json "\{$result\}"
                puts $select_json
                return $select_json

            }      

        } else {

            puts "$errmsg" 
            return -1

        }

    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}


ad_proc -public incl::get_id_grupo {
    -modalidad_nombre
    -periodo_id
    -sede_nombre
    -escuela_nombre
    -curso_nombre
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {


    set anno_id [clock format [clock seconds] -format "%Y"]
    if {[catch { set result [db_string get_id_grupo_query {}] } errmsg] } {

        puts "$errmsg" 
        return -1

    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}

ad_proc -public incl::get_cupo_grupo {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set anno_id [clock format [clock seconds] -format "%Y"]

    set grupo_pk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    if {[catch { set result [db_string get_cupo_grupo_query {}] } errmsg] } {
        
        puts "$errmsg" 
        return -1


    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}

ad_proc -public incl::modif_cupo_grupo {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
    -valor
} {
    @author Jose Daniel Vega Alvarado
} {

    set cupo [lindex [incl::get_cupo_grupo -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id ] 0]
    set grupo_pk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    set cupo [expr $cupo + $valor]

    if {$cupo < 0} {
        puts "no hay cupos disponibles"
        return 2
    }
    
    if {[catch { db_dml modif_cupo_grupo_query {} } errmsg] } {
        
        puts "$errmsg" 
        return -1


    } 

    return 1
}

ad_proc -public incl::get_cant_aceptadas {
    -modalidad_id
    -periodo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set anno_id [clock format [clock seconds] -format "%Y"]


    if {[catch { set result [db_string get_cant_aceptadas_query {}] } errmsg] } {
        
        puts "$errmsg" 
        return -1


    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}

ad_proc -public incl::get_cant_rechazadas {
    -modalidad_id
    -periodo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set anno_id [clock format [clock seconds] -format "%Y"]


    if {[catch { set result [db_string get_cant_rechazadas_query {}] } errmsg] } {
        
        puts "$errmsg" 
        return -1


    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}

ad_proc -public incl::get_resultado_inclusiones {
    -modalidad_id
    -periodo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    puts "esta es la modalidad wadafo -$modalidad_id-"

    set aceptadas [lindex [incl::get_cant_aceptadas -modalidad_id $modalidad_id -periodo_id $periodo_id] 0]
    set rechazadas [lindex [incl::get_cant_rechazadas -modalidad_id $modalidad_id -periodo_id $periodo_id] 0]



    set select_json "\{ \"aceptadas\": \"$aceptadas\", \"rechazadas\": \"$rechazadas\" \}"



    puts $select_json

    return $select_json
}

ad_proc -public incl::get_estado_inclusion_actual {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set anno_id [clock format [clock seconds] -format "%Y"]

    set estudiante_id [ad_conn user_id]

    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    if {[catch { set result [db_string get_estado_inclusion_actual_query {}] } errmsg] } {
        
        puts "$errmsg" 
        return -1


    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}

ad_proc -public incl::get_estado_inclusion_final {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set anno_id [clock format [clock seconds] -format "%Y"]

    set estudiante_id [ad_conn user_id]

    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    if {[catch { set result [db_string get_estado_inclusion_final_query {}] } errmsg] } {
        
        puts "$errmsg" 
        return -1


    } 

    set select_json "\{$result\}"

    puts $select_json

    return $select_json
}

ad_proc -public incl::aceptar_inclusion {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
    -carne_id
} {
    @author Jose Daniel Vega Alvarado
} {


    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    set posible [incl::modif_cupo_grupo -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id -valor 1]
    


    if { $posible eq 1} {
        
        if {[catch { db_dml aceptar_inclusion_query {} } errmsg] } {
            
            puts "$errmsg" 
            return -1
        } 

    } else {
        return 2
    }
    


    return 1
}

ad_proc -public incl::rechazar_inclusion {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
    -carne_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    set posible [incl::modif_cupo_grupo -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id -valor -1]
    
    if { $posible eq 1} {

        if {[catch { db_dml rechazar_inclusion_query {} } errmsg] } {
            
            puts "$errmsg" 
            return -1
        } 

    } 
    


    return 1
}

ad_proc -public incl::delete_inclusion {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set estudiante_id [ad_conn user_id]

    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]


    if {[catch { db_dml delete_inclusion_query {} } errmsg] } {
        
        puts "$errmsg" 
        return -1
    } 

    return 1
}

ad_proc -public incl::cancelar_inclusion {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {

    set estudiante_id [ad_conn user_id]

    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_id -periodo_id $periodo_id -sede_nombre $sede_id -escuela_nombre $escuela_id -curso_nombre $curso_id -grupo_id $grupo_id ] 0]

    set estado_inclusion_actual [lindex [incl::get_estado_inclusion_actual -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id ] 0]
    set estado_inclusion_final [lindex [incl::get_estado_inclusion_final -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id ] 0]

   
    if { $estado_inclusion_final eq "Aceptada" } {
    
        if {[catch { db_dml cancelar_inclusion_query {} } errmsg] } {
        
            puts "$errmsg" 
            return -1
        }
        return 2
    } 

    if { $estado_inclusion_actual eq "Aceptada" } {
    
        set posible [incl::modif_cupo_grupo -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id -valor 1]
    
    }

    set res [incl::delete_inclusion -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_id -escuela_id $escuela_id -curso_id $curso_id -grupo_id $grupo_id]

    return $res
}


ad_proc -public incl::get_infoEstudiante {

} {
    @author Jose Daniel Vega Alvarado[ad_conn user_id]
} {

    set estudiante_id [ad_conn user_id]

    if {[catch { set carne [ tfg::obtenerCarne $estudiante_id ] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  



    if {[catch { set nombre [lindex [lindex [info-general::webservice_api -ws_address http://tecdigital.tec.ac.cr:8082 -ws_name admision -ws_type  DATOS_ESTUDIANTE -ws_parameters $carne] 0] 3] } errmsg] } {
        puts "$errmsg" 
        return -1
    } 


    set select_json "\{ carne \{$carne\} nombre \{$nombre\} \}"
    
    puts $select_json

    return $select_json
}


ad_proc -public incl::insert_grupo_cerrado {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -modalidad_nombre
    -sede_nombre
    -escuela_nombre
    -curso_nombre
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {


    set anno_id [clock format [clock seconds] -format "%Y"]
     
    set grupo_fk [lindex [incl::get_insert_id_grupo -modalidad_id $modalidad_id -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_id $sede_id -sede_nombre $sede_nombre -escuela_id $escuela_id -escuela_nombre $escuela_nombre -curso_id $curso_id -curso_nombre $curso_nombre -grupo_id $grupo_id ] 0]

    if {[catch { db_dml insert_grupo_cerrado_query {} } errmsg] } {
        puts "-----------------------------   $errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::abrir_grupo_cerrado {
    -modalidad_nombre    
    -periodo_id
    -sede_nombre
    -escuela_nombre
    -curso_nombre
    -grupo_id
} {
    @author Jose Daniel Vega Alvarado
} {


    set anno_id [clock format [clock seconds] -format "%Y"]
     
    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_nombre $sede_nombre -escuela_nombre $escuela_nombre -curso_nombre $curso_nombre -grupo_id $grupo_id ] 0]

    if {[catch { db_dml abrir_grupo_cerrado_query {} } errmsg] } {
        puts "-----------------------------   $errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::existe_inclusion {

    -grupo_fk
    -estudiante_id

} {
    @author Jose Daniel Vega Alvarado
} {


    if {[catch { db_string existe_inclusion_query {} } errmsg] } {
        return -1
    }  

    return 1
}




ad_proc -public incl::insert_inclusion {
    -modalidad_id
    -periodo_id
    -sede_id
    -escuela_id
    -curso_id
    -modalidad_nombre
    -sede_nombre
    -escuela_nombre
    -curso_nombre
    -grupo_id
    -comentario_asunto
    -comentario_mensaje
} {
    @author Jose Daniel Vega Alvarado
} {
    set estudiante_id [ad_conn user_id]
    set infoEstudiante [lindex [incl::get_infoEstudiante] 0]
    set carne_id [lindex $infoEstudiante 1]
    set nombre_estudiante [lindex $infoEstudiante 3]

    puts "nombre_estudiante es el $nombre_estudiante"

    set anno_id [clock format [clock seconds] -format "%Y"]
    set estado_actual "Pendiente"
    set estado_final "Pendiente"
     
    set grupo_fk [lindex [incl::get_insert_id_grupo -modalidad_id $modalidad_id -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_id $sede_id -sede_nombre $sede_nombre -escuela_id $escuela_id -escuela_nombre $escuela_nombre -curso_id $curso_id -curso_nombre $curso_nombre -grupo_id $grupo_id ] 0]

    set exist [ incl::existe_inclusion -grupo_fk $grupo_fk -estudiante_id $estudiante_id ]

    if { $exist eq -1} {
        if {[catch { db_dml insert_inclusion_query {} } errmsg] } {
            puts "-----------eee------------------   $errmsg" 
            return -1
        }  
    } else {
        puts "ya existeee"
        return 2
    }   



    return 1
}

ad_proc -public incl::editar_inclusion {
    -periodo_id
    -modalidad_id
    -modalidad_nombre
    -sede_id
    -sede_nombre
    -escuela_id
    -escuela_nombre
    -curso_id
    -curso_nombre
    -grupo_id_viejo
    -grupo_id_nuevo
    -comentario_asunto
    -comentario_mensaje
} {
    @author Jose Daniel Vega Alvarado
} {
    set estudiante_id 
    set infoEstudiante [lindex [incl::get_infoEstudiante] 0]
    set carne_id [lindex $infoEstudiante 1]
    set nombre_estudiante [lindex $infoEstudiante 3]

    puts "carne_id es el $carne_id"

    set anno_id [clock format [clock seconds] -format "%Y"]
    set estado_actual "Pendiente"
    set estado_final "Pendiente"


    set grupo_fk_nuevo [lindex [incl::get_insert_id_grupo -modalidad_id $modalidad_id -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_id $sede_id -sede_nombre $sede_nombre -escuela_id $escuela_id -escuela_nombre $escuela_nombre -curso_id $curso_id -curso_nombre $curso_nombre -grupo_id $grupo_id_nuevo ] 0] 
    set grupo_fk_viejo [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_nombre $sede_nombre -escuela_nombre $escuela_nombre -curso_nombre $curso_nombre -grupo_id $grupo_id_viejo ] 0]

    if {[catch { db_dml editar_inclusion_query {} } errmsg] } {
        puts "-----------------------------   $errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::finalizar_inclusion {

} {
    @author Jose Daniel Vega Alvarado
} {

    if {[catch { db_dml finalizar_inclusion_query {} } errmsg] } {
        puts "-----------------------------   $errmsg" 
        return -1
    }  

    return 1
}

ad_proc -public incl::get_inclusiones_estudiante {
    -modalidad_id
    -periodo_id

} {
    @author Jose Daniel Vega Alvarado
} {
    set estudiante_id [ad_conn user_id]
    set anno_id [clock format [clock seconds] -format "%Y"]

    if {[catch { set result [db_list_of_lists get_inclusiones_estudiante_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set sede_nombre [lindex $elemento 2]
        set escuela_nombre [lindex $elemento 1]
        set curso_nombre [lindex $elemento 3]
        set grupo_numero [lindex $elemento 4]
        set estado [lindex $elemento 7]
        set anno [lindex $elemento 0]
        set comentario_asunto [lindex $elemento 5]
        set comentario_mensaje [lindex $elemento 6]
 
        set select_json "$select_json $json_comma \{
                    \"sede_nombre\": \"$sede_nombre\",
                    \"escuela_nombre\": \"$escuela_nombre\",
                    \"curso_nombre\":  \"$curso_nombre\",
                    \"grupo_numero\":  \"$grupo_numero\",
                    \"estado\":  \"$estado\",
                    \"comentario_asunto\":  \"$comentario_asunto\",
                    \"comentario_mensaje\":  \"$comentario_mensaje\",
                    \"estado\": \"$estado\"

            \}"
        set json_comma ","
    }

    set select_json "$select_json\]"

    return $select_json

}

ad_proc -public incl::get_inclusiones {
    -modalidad_id
    -periodo_id

} {
    @author Jose Daniel Vega Alvarado
} {
    set anno_id [clock format [clock seconds] -format "%Y"]

    if {[catch { set result [db_list_of_lists get_inclusiones_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {
        set sede_nombre [lindex $elemento 2]
        set escuela_nombre [lindex $elemento 1]
        set curso_nombre [lindex $elemento 3]
        set grupo_numero [lindex $elemento 4]
        set estado [lindex $elemento 7]
        set anno [lindex $elemento 0]
        set comentario_asunto [lindex $elemento 5]
        set comentario_mensaje [lindex $elemento 6]
        set carne [lindex $elemento 8]
        set nombre_estudiante [lindex $elemento 9]

        set cupo [incl::get_cupo_grupo -modalidad_id $modalidad_id -periodo_id $periodo_id -sede_id $sede_nombre -escuela_id $escuela_nombre -curso_id $curso_nombre -grupo_id $grupo_numero ]
  
 
        set select_json "$select_json $json_comma \{
                    \"sede_nombre\": \"$sede_nombre\",
                    \"escuela_nombre\": \"$escuela_nombre\",
                    \"curso_nombre\":  \"$curso_nombre\",
                    \"grupo_numero\":  \"$grupo_numero\",
                    \"estado\":  \"$estado\",
                    \"comentario_asunto\":  \"$comentario_asunto\",
                    \"comentario_mensaje\":  \"$comentario_mensaje\",
                    \"carne\":  \"$carne \",
                    \"nombre_estudiante\":  \"$nombre_estudiante\",
                    \"cupo\":  \"$cupo\",
                    \"estado\": \"$estado\"

            \}"
        set json_comma ","
    }
    
    set select_json "$select_json\]"

    return $select_json

}

ad_proc -public incl::get_comentario_inclusion {
    -modalidad_nombre
    -periodo_id
    -sede_nombre
    -escuela_nombre
    -curso_nombre
    -grupo_id
    -carne_id
} {
    @author Jose Daniel Vega Alvarado
} {
    set anno_id [clock format [clock seconds] -format "%Y"]
    set grupo_fk [lindex [incl::get_id_grupo -modalidad_nombre $modalidad_nombre -periodo_id $periodo_id -sede_nombre $sede_nombre -escuela_nombre $escuela_nombre -curso_nombre $curso_nombre -grupo_id $grupo_id ] 0]


    if {[catch { set result [db_list_of_lists get_comentario_inclusion_query {}] } errmsg] } {
        puts "$errmsg" 
        return -1
    }  
    set select_json "\["
    set json_comma ""

    foreach elemento $result {

        set comentario_asunto [lindex $elemento 0]
        set comentario_mensaje [lindex $elemento 1]
 
        set select_json "$select_json $json_comma \{
                    \"comentario_asunto\":  \"$comentario_asunto \",
                    \"comentario_mensaje\":  \"$comentario_mensaje \"

            \}"
        set json_comma ","
    }
    
    set select_json "$select_json\]"

    return $select_json

}

ad_proc -public incl::get_grupos_cerrados {
    -modalidad_id
    -periodo_id

} {
    @author Jose Daniel Vega Alvarado
} {
    set anno_id [clock format [clock seconds] -format "%Y"]

    if {[catch { set result [db_list_of_lists get_grupos_cerrados_query {}] } errmsg] } {
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
       
 
        set select_json "$select_json $json_comma \{
                    \"sede_nombre\": \"$sede_nombre\",
                    \"escuela_nombre\": \"$escuela_nombre\",
                    \"curso_nombre\":  \"$curso_nombre \",
                    \"grupo_numero\":  \"$grupo_numero \"
            \}"
        set json_comma ","
    }
    
    set select_json "$select_json\]"

    return $select_json

}

