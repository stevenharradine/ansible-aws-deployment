printf "create launch configuration ($launch_configuration_name)"
launch_configuration="aws autoscaling create-launch-configuration \
  --region $region \
  --launch-configuration-name $launch_configuration_name \
  --image-id $image_id \
  --instance-type $instance_type \
  --associate-public-ip-address \
  --security-groups $security_group_ids"

  if [ $environment_tier != "production" ]; then
    launch_configuration="$launch_configuration --spot-price $spot_price"
  fi

 `$launch_configuration`
echo " . done"
