#!/bin/bash

source config.sh

source vars.sh

source deploy-app-code.sh
source create-ami.sh
source get-security-group-id.sh
source create-launch-configuration.sh
source use-new-launch-configuration.sh
source scale-up.sh
source scale-down.sh
