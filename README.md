# aws-deployment

## dependancies
 * pip install awscli
 * jsawk
 * aws tags (Project, Role, Environment)
 * aws autoscaling groups

## usage
```
./deploy.sh {{ instance_id }}
```
### example
```
$ ./deploy.sh i-a1b2c3d4

scan tags . done
deploy app code . done
create image ami-a1b2c3d4 from i-a1b2c3d4 . . . . . done (available)
get security group ids for i-a1b2c3d4 . done (sg-a1b2c3d4)
create launch configuration (project-role-20160111215758) . done
update autoscaling group (project-role) to use new launch configuration (project-role-20160111215758) . done
scale up . . done
scale down . . . . . . . . . . done
```