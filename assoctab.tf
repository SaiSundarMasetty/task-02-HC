#routable associaton
resource "aws_route_table_association" "IG-assoc" {
   subnet_id      = aws_subnet.subnet_pub.id
  route_table_id = aws_route_table.IGroute.id
  depends_on = [aws_subnet.subnet_pub]
}