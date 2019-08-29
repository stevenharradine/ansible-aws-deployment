printf "update autoscaling group ($autoscaling_group_name) to use new launch configuration ($launch_configuration_name)"
autoscaling_group=`aws autoscaling update-auto-scaling-group \
  --region $region \
  --auto-scaling-group-name=$autoscaling_group_name \
  --launch-configuration-name=$launch_configuration_name`
echo " . done"
