# public_subnet
resource "aws_subnet" "subnet_pub" {

  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = "192.168.1.0/24"
  map_public_ip_on_launch = true
  depends_on = [aws_vpc.vpc]
  tags= {
     Name = "subnet_pub"
}
}