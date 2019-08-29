timestamp=`date +%Y%m%d%H%M%S`
name=$project-$role-$timestamp
launch_configuration_name=$name
security_group_name=$project-$role
autoscaling_group_name=$project-$role
autoscaling_group_desired_capacity_double=$(($autoscaling_group_desired_capacity*2))
spot_price=0.044
