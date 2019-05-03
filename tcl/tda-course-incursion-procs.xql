<?xml version="1.0"?>
<queryset>

     <fullquery name="incl::insert_inclusion.insert_inclusion_query"> 
        <querytext>
            INSERT INTO sch_tda_inclusion.inclusion (id_estudiante,id_anno,id_modalidad,id_periodo,id_depto,id_sede,id_materia,id_grupo,comentario_asunto,comentario_mensaje,estado) 
            VALUES (:estudiante_id,:anno_id,:modalidad_id, :periodo_id, :escuela_id, :sede_id, :curso_id, :grupo_id, :comentario_asunto, :comentario_mensaje, :estado);
        </querytext>
    </fullquery> 

    <fullquery name="incl::get_inclusiones_estudiante.get_inclusiones_estudiante_query"> 
        <querytext>
            SELECT i.id_anno, i.id_depto, i.id_sede, i.id_materia, i.id_grupo, i.comentario_asunto, i.comentario_mensaje, i.estado 
                FROM sch_tda_inclusion.inclusion i WHERE i.id_estudiante = :estudiante_id and i.id_modalidad = :modalidad_id and i.id_periodo = :periodo_id  and i.id_anno = :anno_id;
        </querytext>
    </fullquery>   

    <fullquery name="incl::get_inclusiones.get_inclusiones_query"> 
        <querytext>
            SELECT i.id_anno, i.id_depto, i.id_sede, i.id_materia, i.id_grupo, i.comentario_asunto, i.comentario_mensaje, i.estado 
                FROM sch_tda_inclusion.inclusion i WHERE i.id_modalidad = :modalidad_id and i.id_periodo = :periodo_id  and i.id_anno = :anno_id;
        </querytext>
    </fullquery>   













    <fullquery name="incl::insert_comentario.insert_comentario_query"> 
        <querytext>
            INSERT INTO sch_tda_inclusion.comentarios (asunto, mensaje, id_estudiante, comentario_escuela_fk) values (:asunto,:mensaje,:id_estudiante,:id_escuela);
        </querytext>
    </fullquery>   

    <fullquery name="incl::get_comentario_escuela.get_comentario_escuela_query"> 
        <querytext>
            SELECT * FROM sch_tda_inclusion.comentarios c WHERE c.comentario_escuela_fk = :id_escuela;
        </querytext>
    </fullquery>   


 

</queryset>