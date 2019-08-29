#!/bin/bash
source config.sh

source find-prototype-region.sh

if [[ "$region" != "" ]]; then
	source get-tags.sh
	source vars.sh

	source deploy-app-code.sh
	source create-ami.sh
	source get-security-group-id.sh
	source create-launch-configuration.sh
	source use-new-launch-configuration.sh
	source scale-up.sh
	source wait-scale-up.sh
	source scale-down.sh
else
	echo "Error: prototype not found"
fi
