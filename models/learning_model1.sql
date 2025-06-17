{{
    config(
        materialized='incremental',
        post_hook = [
            "DELETE FROM {{ this }} where AGE > 100 AND AGE<25"
        ]
    )

}}
SELECT 
NAME, YEAR(CURRENT_DATE()) - YEAR(TO_DATE(DOB)) AS AGE,  DOB, ADDRESS, current_timestamp() as LOAD_DATE_TIME
FROM {{ source("MY_TABLE_NAME", "MY_TABLE")}}
WHERE AGE>25