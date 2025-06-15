{% test accepted_range(model, column_name, start, end) %}
    SELECT {{ column_name }}
    FROM {{ model }}
    WHERE {{ column_name }} NOT BETWEEN {{ start }} AND {{ end }}
{% endtest%}