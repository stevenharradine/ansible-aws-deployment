printf "Waiting for instance to become InService"
all_instances_inservice=false
while [ $all_instances_inservice == false ]; do
  all_instances_inservice=true

  for i in `seq 1 $number_of_tags`; do
    currentIndex=$[$i-1]
    current_state=`echo $cached_instance_json | jsawk "return this.InstanceStates[$currentIndex].State"`

    if [[ $current_state != "InService" ]]; then
      all_instances_inservice=false
    fi
  done

  if [ $all_instances_inservice == false ]; then
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
