#internet gateway
resource "aws_internet_gateway" "IG" {

  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]
  tags = {
    Name = "IG"
  }
}