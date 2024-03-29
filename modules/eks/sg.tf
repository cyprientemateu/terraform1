# Security Group for Worker Nodes
resource "aws_security_group" "worker_nodes_sg" {
  name        = "worker-nodes-sg"
  description = "Security group for Amazon EKS worker nodes"

  vpc_id = aws_vpc.tcc_vpc.id # Replace with your VPC ID

  # Allow inbound traffic from the master nodes on the Kubernetes API server port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.tcc_vpc.cidr_block]
  }

  # Allow outbound traffic to the EKS control plane endpoints
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow outbound traffic to any destination
  }
}

# Security Group for EKS Control Plane (Master Nodes)
resource "aws_security_group" "eks_control_plane_sg" {
  name        = "eks-control-plane-sg"
  description = "Security group for Amazon EKS control plane (master nodes)"

  vpc_id = aws_vpc.tcc_vpc.id # Replace with your VPC ID

  # Allow inbound traffic from worker nodes on the Kubernetes API server port
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.worker_nodes_sg.id]
  }

  # EKS control plane may not require outbound traffic to worker nodes
  # Adjust egress rules as necessary based on additional requirements
}
