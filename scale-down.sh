printf "scale down"
autoscaling_group=`aws autoscaling update-auto-scaling-group \
  --region $region \
  --auto-scaling-group-name=$autoscaling_group_name \
  --desired-capacity=$autoscaling_group_desired_capacity`
while true
do
  size_of_autoscaling_group=`aws autoscaling describe-auto-scaling-groups \
    --region $region \
    --auto-scaling-group-names=$autoscaling_group_name | \
    jsawk "return this.AutoScalingGroups[0].Instances.length"`

  printf " ."
  if [ $size_of_autoscaling_group -eq $autoscaling_group_desired_capacity ]; then
    break
  else
    sleep 15
  fi
done
echo " done"
