#Problem: Distributed systems generate fragmented logs.
#Solution: Use OpenStack's ceilometer and logstash to centralize logs.

#!/bin/bash
# Install Logstash
sudo apt update && sudo apt install -y logstash

# Configure Logstash
cat <<EOL > /etc/logstash/conf.d/openstack.conf
input {
  file {
    path => "/var/log/ceilometer/*.log"
    start_position => "beginning"
  }
}
output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
  }
  stdout { codec => rubydebug }
}
EOL

# Start Logstash
sudo systemctl restart logstash
