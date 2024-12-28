# Public Subnet NACL
resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.tcc_vpc.id

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-public-nacl", var.tags["id"], var.tags["environment"], var.tags["project"])
  })
}

resource "aws_network_acl_rule" "public_inbound" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_ssh" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 110
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = "0.0.0.0/0" # Replace with allowed CIDR for SSH
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "public_egress" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 120
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = true
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

# Private Subnet NACL
resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.tcc_vpc.id

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-private-nacl", var.tags["id"], var.tags["environment"], var.tags["project"])
  })
}

resource "aws_network_acl_rule" "private_inbound" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  cidr_block     = "10.0.0.0/16" # Internal communication
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "private_outbound" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 110
  protocol       = "-1" # Allow all protocols
  rule_action    = "allow"
  egress         = true
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_egress" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 120
  protocol       = "-1" // All protocols
  rule_action    = "allow"
  egress         = true
  cidr_block     = "0.0.0.0/0"
}

# Associate NACLs with Subnets
resource "aws_network_acl_association" "public_assoc" {
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  network_acl_id = aws_network_acl.public_nacl.id
  count          = length(var.public_subnet_cidrs)
}

resource "aws_network_acl_association" "private_assoc" {
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  network_acl_id = aws_network_acl.private_nacl.id
  count          = length(var.private_subnet_cidrs)
}
