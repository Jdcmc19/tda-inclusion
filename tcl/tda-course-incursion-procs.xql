<?xml version="1.0"?>
<queryset>


     <fullquery name="incl::get_insert_id_grupo.get_insert_id_grupo_query"> 
        <querytext>
            SELECT pk_grupo FROM sch_tda_inclusion.grupo 
                            WHERE id_anno = :anno_id and id_modalidad = :modalidad_nombre and id_periodo = :periodo_id and id_sede = :sede_nombre 
                            and id_depto = :escuela_nombre and id_materia = :curso_nombre and id_grupo = :grupo_id;
        </querytext>
    </fullquery> 

    fullquery name="incl::get_id_grupo.get_id_grupo_query"> 
        <querytext>
            SELECT pk_grupo FROM sch_tda_inclusion.grupo 
                            WHERE id_anno = :anno_id and id_modalidad = :modalidad_nombre and id_periodo = :periodo_id and id_sede = :sede_nombre 
                            and id_depto = :escuela_nombre and id_materia = :curso_nombre and id_grupo = :grupo_id;
        </querytext>
    </fullquery> 

    <fullquery name="incl::get_cupo_grupo.get_cupo_grupo_query"> 
        <querytext>
            SELECT cupodisponible FROM sch_tda_inclusion.grupo 
                            WHERE id_anno = :anno_id and id_modalidad = :modalidad_id and id_periodo = :periodo_id and id_sede = :sede_id 
                            and id_depto = :escuela_id and id_materia = :curso_id and id_grupo = :grupo_id;
        </querytext>
    </fullquery> 

    <fullquery name="incl::insert_inclusion.insert_inclusion_query"> 
        <querytext>
            INSERT INTO sch_tda_inclusion.inclusion (id_carne, id_estudiante, estado_actual, estado_final, nombre_estudiante, comentario_asunto, comentario_mensaje, grupo_pk_grupo)
            VALUES (:carne_id,:estudiante_id,:estado_actual,:estado_final,:nombre_estudiante,:comentario_asunto,:comentario_mensaje,:grupo_fk);
        </querytext>
    </fullquery> 

    <fullquery name="incl::insert_grupo_cerrado.insert_grupo_cerrado_query"> 
        <querytext>
            INSERT INTO sch_tda_inclusion.cerrado (grupo_pk_grupo) VALUES (:grupo_fk);
        </querytext>
    </fullquery> 

    <fullquery name="incl::abrir_grupo_cerrado.abrir_grupo_cerrado_query"> 
        <querytext>
            DELETE FROM sch_tda_inclusion.cerrado WHERE grupo_pk_grupo = :grupo_fk;
        </querytext>
    </fullquery> 

    <fullquery name="incl::insert_grupo.insert_grupo_query"> 
        <querytext>
            INSERT INTO sch_tda_inclusion.grupo (id_anno,id_modalidad,id_periodo,id_sede,id_depto,id_materia,id_grupo,cupodisponible) 
            VALUES (:anno_id,:modalidad_nombre,:periodo_id,:sede_nombre,:escuela_nombre,:curso_nombre,:grupo_id,:cupo);
        </querytext>
    </fullquery> 

    <fullquery name="incl::get_inclusiones_estudiante.get_inclusiones_estudiante_query"> 
        <querytext>
            SELECT g.id_anno, g.id_depto, g.id_sede, g.id_materia, g.id_grupo, i.comentario_asunto, i.comentario_mensaje, i.estado_final 
                FROM sch_tda_inclusion.inclusion i INNER JOIN sch_tda_inclusion.grupo g on (i.grupo_pk_grupo = g.pk_grupo) WHERE i.id_estudiante = :estudiante_id and g.id_modalidad = :modalidad_id and g.id_periodo = :periodo_id  and g.id_anno = :anno_id;
        </querytext>
    </fullquery>   

    <fullquery name="incl::get_inclusiones.get_inclusiones_query"> 
        <querytext>
            SELECT g.id_anno, g.id_depto, g.id_sede, g.id_materia, g.id_grupo, i.comentario_asunto, i.comentario_mensaje, i.estado_actual, i.id_carne, i.nombre_estudiante
                FROM sch_tda_inclusion.inclusion i INNER JOIN sch_tda_inclusion.grupo g on (i.grupo_pk_grupo = g.pk_grupo) WHERE g.id_modalidad = :modalidad_id and g.id_periodo = :periodo_id  and g.id_anno = :anno_id;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_comentario_inclusion.get_comentario_inclusion_query"> 
        <querytext>
            SELECT i.comentario_asunto, i.comentario_mensaje
                FROM sch_tda_inclusion.inclusion i INNER JOIN sch_tda_inclusion.grupo g on (i.grupo_pk_grupo = g.pk_grupo) WHERE g.pk_grupo = :grupo_fk and i.id_carne = :carne_id;
        </querytext>
    </fullquery>   

    <fullquery name="incl::get_grupos_cerrados.get_grupos_cerrados_query"> 
        <querytext>
            SELECT g.id_sede, g.id_depto, g.id_materia, g.id_grupo 
                FROM sch_tda_inclusion.cerrado c INNER JOIN sch_tda_inclusion.grupo g on (g.grupo_pk_grupo = g.pk_grupo) WHERE g.id_modalidad = :modalidad_id and g.id_periodo = :periodo_id  and g.id_anno = :anno_id;
        </querytext>
    </fullquery>  

    <fullquery name="incl::editar_inclusion.editar_inclusion_query"> 
        <querytext>
            UPDATE sch_tda_inclusion.inclusion SET comentario_asunto = :comentario_asunto, comentario_mensaje = :comentario_mensaje, grupo_pk_grupo = :grupo_fk_nuevo,
             estado_actual = :estado_actual, estado_final = :estado_final
            WHERE id_estudiante = :estudiante_id and grupo_pk_grupo = :grupo_fk_viejo;
        </querytext>
    </fullquery>  
 
    <fullquery name="incl::finalizar_inclusion.finalizar_inclusion_query"> 
        <querytext>
            UPDATE sch_tda_inclusion.inclusion SET estado_final = estado_actual WHERE estado_actual <> 'Pendiente';
        </querytext>
    </fullquery> 


 

</queryset>