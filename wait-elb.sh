printf "Waiting for addition to ELB"
cached_instance_json=`aws elb describe-instance-health \
  --region $region \
  --load-balancer-name $autoscaling_group_name`

number_of_tags=`echo $cached_instance_json | \
  jsawk "return this.InstanceStates.length"`

while [ $number_of_tags -ne $autoscaling_group_desired_capacity_double ]; do
  for i in `seq 1 $number_of_tags`; do
    currentIndex=$[$i-1]
    current_state=`echo $cached_instance_json | jsawk "return this.InstanceStates[$currentIndex].State"`

    if [ $current_state != "InService" ]; then
      all_instances_inservice=false
    fi
  done

  if [ $number_of_tags -ne $autoscaling_group_desired_capacity_double ]; then
    sleep 10

    cached_instance_json=`aws elb describe-instance-health \
      --region $region \
      --load-balancer-name $autoscaling_group_name`

    number_of_tags=`echo $cached_instance_json | \
      jsawk "return this.InstanceStates.length"`
  fi
  printf " ."
done

echo " Done"
