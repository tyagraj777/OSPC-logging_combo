#Problem: Logs are lost when instances terminate.
#Solution: Mount an external log volume to persist logs.

#!/bin/bash
INSTANCE_ID="your-instance-id"
VOLUME_ID="your-volume-id"

# Attach the volume
openstack server add volume $INSTANCE_ID $VOLUME_ID

# Mount the volume to /var/log
ssh -i ~/.ssh/id_rsa ubuntu@<instance_ip> <<EOF
  sudo mkfs.ext4 /dev/vdb
  sudo mkdir -p /mnt/logs
  sudo mount /dev/vdb /mnt/logs
  sudo ln -s /mnt/logs /var/log
EOF
