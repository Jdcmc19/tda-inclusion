<?xml version="1.0"?>
<queryset>
    <fullquery name="incl::get_sedes.get_sedes_query">      
        <querytext>
            SELECT s.nombre, s.sede_pk FROM sch_tda_inclusion.sedes s;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_escuelas.get_escuelas_query">      
        <querytext>
            SELECT e.nombre, e.escuela_pk FROM sch_tda_inclusion.escuelas e WHERE e.escuela_sede_fk = :sede_id ;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_cursos.get_cursos_query">      
        <querytext>
            SELECT c.nombre, c.curso_pk FROM sch_tda_inclusion.cursos c WHERE c.curso_escuela_fk = :escuela_id;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_grupos.get_grupos_query">      
        <querytext>
            SELECT g.numero_grupo, g.grupo_pk FROM sch_tda_inclusion.grupos g WHERE g.grupo_curso_fk = :curso_id;

        </querytext>
    </fullquery>  



    <fullquery name="incl::get_sede_id.get_sede_id_query"> 
        <querytext>
            SELECT s.sede_pk FROM sch_tda_inclusion.sedes s WHERE s.nombre = :nombre_sede;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_escuela_id.get_escuela_id_query">      
        <querytext>
            SELECT e.escuela_pk FROM sch_tda_inclusion.escuelas e WHERE e.escuela_sede_fk = :sede_id and e.nombre = :escuela_nombre;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_curso_id.get_curso_id_query">      
        <querytext>
            SELECT c.curso_pk FROM sch_tda_inclusion.cursos c WHERE c.curso_escuela_fk = :escuela_id and c.nombre = :curso_nombre;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_grupo_id.get_grupo_id_query">      
        <querytext>
            SELECT g.grupo_pk FROM sch_tda_inclusion.grupos g WHERE g.grupo_curso_fk = :curso_id and g.numero_grupo = :numero_grupo;
        </querytext>
    </fullquery>  



     <fullquery name="incl::insert_inclusion.insert_inclusion_query"> 
        <querytext>
            INSERT INTO sch_tda_inclusion.inclusion (id_estudiante,id_anno,id_modalidad,id_periodo,id_depto,id_sede,id_materia,id_grupo,comentario_asunto,comentario_mensaje,estado) VALUES (:estudiante_id,:anno_id,:modalidad_id, :periodo_id, :depto_id, :sede_id, :materia_id, :id_grupo, :comentario_asunto, :comentario_mensaje, "Pendiente");
        </querytext>
    </fullquery> 

    <fullquery name="incl::get_inclusiones_estudiante.get_inclusiones_estudiante_query"> 
        <querytext>
            SELECT s.nombre as Sede,e.nombre as Escuela,c.nombre as Curso, g.numero_grupo as Grupo,'Pendiente' as Estado FROM sch_tda_inclusion.inclusiones i INNER JOIN sch_tda_inclusion.grupos g ON(i.inclusion_grupo_fk = g.grupo_pk) 
                INNER JOIN sch_tda_inclusion.cursos c ON (g.grupo_curso_fk = c.curso_pk) INNER JOIN sch_tda_inclusion.escuelas e ON (e.escuela_pk = c.curso_escuela_fk)
                    INNER JOIN sch_tda_inclusion.sedes s ON (s.sede_pk = e.escuela_sede_fk)
                        WHERE i.id_estudiante = :id_estudiante;
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