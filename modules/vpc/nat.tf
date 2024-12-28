# resource "aws_nat_gateway" "tcc_nat" {
#   # count = length(var.private_subnet_cidrs)
#   count         = var.tags["environment"] == "production" ? length(var.availability_zones) : var.nat_number
#   subnet_id     = element(aws_subnet.public[*].id, count.index)
#   allocation_id = element(aws_eip.tcc_eip[*].id, count.index)

#   tags = {
#     # Name = "${var.vpc_name}-tcc_nat-gateway-${count.index + 1}"
#     Name = format("%s-%s-%s-tcc-nat-gateway-${count.index + 1}-${element(var.availability_zones, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])
#   }
#   depends_on = [aws_internet_gateway.tcc_igw]
# }

resource "aws_nat_gateway" "tcc_nat" {
  count         = var.tags["environment"] == "production" ? length(var.availability_zones) : var.nat_number
  subnet_id     = aws_subnet.public[count.index].id
  allocation_id = aws_eip.tcc_eip[count.index].id

  tags = {
    Name = format("%s-%s-%s-tcc-nat-gateway-%d-%s",
      var.tags["id"],
      var.tags["environment"],
      var.tags["project"],
      count.index + 1,
    var.availability_zones[count.index])
  }
  depends_on = [aws_internet_gateway.tcc_igw]
}