# aws-deployment

Script that will build an image from a known instance, make a new launch configuration and sets this as the new launch configuration for the autoscaling group.  We then scale up then back down the instances providing a zero downtime deployment.

[![Licence](https://img.shields.io/badge/Licence-ISC-blue.svg)](https://opensource.org/licenses/ISC)

## dependancies
 * pip install awscli
 * jsawk
 * aws tags (Project, Role, Environment)
 * aws autoscaling groups

## configure
in `config.sh` set your domain and desired number of instances in the auto scaling group.

You have to fill this out. Make sure you have to AWS Access Key and Secret Access Key handy.

```
$ aws configure 
AWS Access Key ID [None]: 
AWS Secret Access Key [None]: 
Default region name [None]: us-west-2
Default output format [None]: 
```

## usage
```
./deploy.sh {{ instance_id }}
```
### example
```
$ ./deploy.sh i-a1b2c3d4

find prototype region . done (us-west-2)
scan tags . done
deploy app code . done
create image ami-a1b2c3d4 from i-a1b2c3d4 . . . . . done (available)
get security group ids for i-a1b2c3d4 . done (sg-a1b2c3d4)
create launch configuration (project-role-20160111215758) . done
update autoscaling group (project-role) to use new launch configuration (project-role-20160111215758) . done
scale up . . done
Waiting for addition to ELB . . . Done
Waiting for instance to become InService . . . . . . . Done
scale down . . . . . . . . . . done
```
