<?xml version="1.0"?>
<queryset>

    <fullquery name="incl::insert_info.insert_info_query">      
        <querytext>
            SELECT dependency_id
                FROM sch_td_task_record.user_dependency
                WHERE user_id = :user_id; 
        </querytext>
    </fullquery>

    <fullquery name="incl::get_info.get_info_query">      
        <querytext>
            SELECT dependency_id, name
                FROM sch_td_task_record.td_dependency;
        </querytext>
    </fullquery>    

</queryset>