printf "scan tags"
cached_instance_json=`aws ec2 describe-instances \
  --region $region \
  --instance-ids $instance_id`

number_of_tags=`echo $cached_instance_json | \
  jsawk "return this.Reservations[0].Instances[0].Tags.length"`

for i in `seq 1 $number_of_tags`;
do
  currentIndex=$[$i-1]
  current_key=`echo $cached_instance_json | jsawk "return this.Reservations[0].Instances[0].Tags[$currentIndex].Key"`
  current_value=`echo $cached_instance_json | jsawk "return this.Reservations[0].Instances[0].Tags[$currentIndex].Value"`

  if [ $current_key == "Role" ]; then
    role=$current_value
  elif [ $current_key == "Project" ]; then
    project=$current_value
  elif [ $current_key == "Environment" ]; then
    environment_tier=$current_value
  fi
done

instance_type=`echo $cached_instance_json | jsawk "return this.Reservations[0].Instances[0].InstanceType"`

echo " . done"
