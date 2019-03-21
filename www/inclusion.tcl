ad_page_contract {
    Porpuse: include inclusions
} {

}

set user [auth::require_login]
set user_id [ad_conn user_id]
set user_name [tda-notifications::user::getName -user_id $user_id]