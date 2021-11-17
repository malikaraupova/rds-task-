resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-09e536d99b4997f7b", "subnet-0c14fdb44be78ac44", "subnet-0ad9d58036f583961"]
 
  enable_deletion_protection = false
}
