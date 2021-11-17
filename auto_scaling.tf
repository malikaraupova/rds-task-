module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"

  # Autoscaling group
  name                        = "paris-asg"
  min_size                    = 5
  max_size                    = 500
  desired_capacity            = 5
  wait_for_capacity_timeout   = 0
  health_check_type           = "EC2"
  associate_public_ip_address = true
  vpc_zone_identifier         = ["subnet-09e536d99b4997f7b", "subnet-0c14fdb44be78ac44", "subnet-0ad9d58036f583961"]




  # Launch template
  lt_name                = "paris-asg"
  description            = "Launch template example"
  update_default_version = true
  use_lt                 = true
  create_lt              = true
  image_id               = "ami-05f0a049e7aeb407c"
  instance_type          = "t3.micro"
  ebs_optimized          = true
  enable_monitoring      = true


  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [aws_security_group.rds.id]
    }
  ]

}


 