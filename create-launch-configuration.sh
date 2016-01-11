printf "create launch configuration ($launch_configuration_name)"
launch_configuration=`aws autoscaling create-launch-configuration \
  --launch-configuration-name $launch_configuration_name \
  --image-id $image_id \
  --instance-type $instance_type \
  --associate-public-ip-address \
  --security-groups $security_group_ids`
echo " . done"
