# resource "aws_eip" "tcc_eip" {
#   count = length(var.private_subnet_cidrs)

#   tags = {
#     # Name = "${var.vpc_name}-tcc_eip-${count.index + 1}"
#     Name = format("%s-%s-%s-tcc-eip-${count.index + 1}-${element(var.availability_zones, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])
#   }
#   depends_on = [aws_internet_gateway.tcc_igw]
# }

resource "aws_eip" "tcc_eip" {
  count = var.tags["environment"] == "production" ? length(var.availability_zones) : var.nat_number
  vpc   = true
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-tcc-eip-${count.index + 1}-${element(var.availability_zones, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}