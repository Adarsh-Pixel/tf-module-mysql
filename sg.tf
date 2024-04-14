# Creates security group
resource "aws_security_group" "allows_mysql" {
  name                      = "allows_mysql"
  description               = "Allows Only private traffic"
  vpc_id                    = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description              = "mysql from private network"
    from_port                = 3306
    to_port                  = 3306
    protocol                 = "tcp"
    cidr_blocks              = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    cidr_blocks              = ["0.0.0.0/0"]
  }

  tags = {
    Name                     = "roboshop-${var.ENV}-mysql-sg"
  }
}