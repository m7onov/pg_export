{% if type == 'enum' -%}
create type {{ full_name }} as enum (
    {%- for l in enum_lables %}
    '{{ l }}' {%- if not loop.last %},{% endif %}
    {%- endfor %}
);
{% endif -%}

{%- if type == 'composite' -%}
create type {{ full_name }} as (
    {%- include '10/out/attribute.sql' %}
);
{% endif -%}

{% if acl -%}
{{ acl|acl_to_grants('type', full_name) }}
{% endif -%}