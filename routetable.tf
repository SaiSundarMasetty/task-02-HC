# routetable for IG
 resource "aws_route_table" "IGroute" {

  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }
  depends_on = [aws_vpc.vpc]
  tags = {
    Name = "IGroute"
  }
}