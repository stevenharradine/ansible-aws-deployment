printf "get security group ids for $instance_id"
number_of_security_groups=`aws ec2 describe-instances --region $region --instance-ids $instance_id | jsawk "return this.Reservations[0].Instances[0].SecurityGroups.length"`
security_group_ids=""

for i in `seq 1 $number_of_security_groups`;
do
  currentIndex=$[$i-1]
  current_security_group=`aws ec2 describe-instances --region $region --instance-ids $instance_id | jsawk "return this.Reservations[0].Instances[0].SecurityGroups[$currentIndex].GroupId"`
  security_group_ids+="$current_security_group"

  if [ $currentIndex -ne $[$number_of_security_groups-1] ]; then
    security_group_ids+=" "
  fi
done
echo " . done ($security_group_ids)"
