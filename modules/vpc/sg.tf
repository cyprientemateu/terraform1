resource "aws_security_group" "tcc_sg" {
  description = "Security group for my EC2 instance"
  vpc_id      = aws_vpc.tcc_vpc.id
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-tcc-sg", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )

  // Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow SSH access from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow HTTP access from anywhere
  }

  // Inbound rules for Node communication with EKS Control Plane
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow inbound traffic on 443 from the EKS control plane (public access if EKS is public)
  }

  // Allow communication with other nodes on port 10250 (Kubelet)
  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] // Allow all outbound traffic
  }
}
