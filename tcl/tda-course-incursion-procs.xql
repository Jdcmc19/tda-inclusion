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
            INSERT INTO sch_tda_inclusion.inclusiones (id_estudiante, inclusion_grupo_fk) values(:id_estudiante,:id_grupo);
        </querytext>
    </fullquery> 

    <fullquery name="incl::get_inclusiones_estudiante.get_inclusiones_estudiante_query"> 
        <querytext>
            SELECT c.nombre, g.numero_grupo, i.id_estudiante FROM sch_tda_inclusion.inclusiones i INNER JOIN sch_tda_inclusion.grupos g ON(i.inclusion_grupo_fk = g.grupo_pk) 
                INNER JOIN sch_tda_inclusion.cursos c ON (g.grupo_curso_fk = c.curso_pk)
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