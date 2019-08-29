printf "find prototype region"

region=''
for this_region in "${aws_regions[@]}"
do
	cached_instance_json=`aws ec2 describe-instances \
		--region $this_region \
		--instance-ids $instance_id \
		2> /dev/null`

	valid=`echo $cached_instance_json | grep "Reservations" | wc -l`

	if [[ $valid -gt 0 ]]; then
		region=$this_region
		break;
	fi
done

echo " . done ($region)"