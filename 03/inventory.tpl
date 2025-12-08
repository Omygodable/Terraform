[webservers]
{% for host in web_servers %}
{{host.name}} ansible_host={{host.external_ip_address}} fqdn={{host.network_interfaces.0.ipv4}}
{% endfor %}

[databases]
{% for db in database_servers %}
{{db.name}} ansible_host={{db.external_ip_address}} fqdn={{db.network_interfaces.0.ipv4}}
{% endfor %}

[storage]
{{storage.name}} ansible_host={{storage.external_ip_address}} fqdn={{storage.network_interfaces.0.ipv4}}