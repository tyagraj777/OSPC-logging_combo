#Problem: Limited access to hypervisors for debugging.
#Solution: Enable and analyze hypervisor logs.

#!/bin/bash
# Enable hypervisor logs
openstack compute service set --debug nova-compute

# Fetch hypervisor logs
nova hypervisor-stats
scp root@<hypervisor-ip>:/var/log/nova/nova-compute.log .

# Analyze the logs
cat nova-compute.log | grep "ERROR"
