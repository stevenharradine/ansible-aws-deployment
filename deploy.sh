#!/bin/bash

source config.sh

# HACKS
image_id=ami-40fde621
security_group_id=sg-2566e541

source vars.sh

source deploy-app-code.sh
source create-ami.sh
source create-launch-configuration.sh
source use-new-launch-configuration.sh
source scale-up.sh
source scale-down.sh
