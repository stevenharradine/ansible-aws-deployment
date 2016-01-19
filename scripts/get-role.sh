cached_instance_json=`aws ec2 describe-instances \
  --instance-ids $instance_id`

number_of_tags=`echo $cached_instance_json | \
  jsawk "return this.Reservations[0].Instances[0].Tags.length"`

for i in `seq 1 $number_of_tags`;
do
  currentIndex=$[$i-1]
  current_key=`echo $cached_instance_json | jsawk "return this.Reservations[0].Instances[0].Tags[$currentIndex].Key"`

  if [ $current_key == "Role" ]; then
    echo `$cached_instance_json | jsawk "return this.Reservations[0].Instances[0].Tags[$currentIndex].Value"`
  fi
done
