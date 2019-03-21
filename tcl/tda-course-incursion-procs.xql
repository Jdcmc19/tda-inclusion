<?xml version="1.0"?>
<queryset>
    <fullquery name="incl::get_sedes.get_sedes_query">      
        <querytext>
            SELECT s.nombre FROM sch_tda_inclusion.sedes s;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_escuelas.get_escuelas_query">      
        <querytext>
            SELECT e.nombre FROM sch_tda_inclusion.escuelas e WHERE e.escuela_sede_fk = :sede_id ;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_cursos.get_cursos_query">      
        <querytext>
            SELECT c.nombre FROM sch_tda_inclusion.cursos c WHERE c.curso_escuela_fk = :escuela_id;
        </querytext>
    </fullquery>  

    <fullquery name="incl::get_grupos.get_grupos_query">      
        <querytext>
            SELECT g.numero_grupo FROM sch_tda_inclusion.grupos g WHERE g.grupo_curso_fk = :curso_id;

        </querytext>
    </fullquery>  
 

</queryset>