# resource "aws_eip" "tcc_eip" {
#   count = var.tags["environment"] == "production" ? length(var.availability_zones) : var.nat_number
#   # vpc   = true
#   tags = merge(var.tags, {
#     Name = format("%s-%s-%s-tcc-eip-${count.index + 1}-${element(var.availability_zones, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])
#     },
#   )
# }

resource "aws_eip" "tcc_eip" {
  count = var.tags["environment"] == "production" ? length(var.availability_zones) : var.nat_number
  # vpc   = true

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-tcc-eip-%d-%s",
      var.tags["id"],
      var.tags["environment"],
      var.tags["project"],
      count.index + 1,
    var.availability_zones[count.index])
  })
}