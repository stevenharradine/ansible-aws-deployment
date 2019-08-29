printf "create image "
image_id=`aws ec2 create-image --region $region --instance-id=$instance_id --name=$name | jsawk "return this.ImageId"`
printf "$image_id from $instance_id"

# wait till the image is available
while true
do
  image_state_json=`aws ec2 describe-images --region $region --image-ids=$image_id`
  image_state=`echo "$image_state_json" | jsawk "return this.Images[0].State"`

  printf " ."

  if [ "$image_state" = "available" ] || [ "$image_state" = "failed" ]; then
    break
  else
    sleep 15
  fi
done
echo " done ($image_state)"
