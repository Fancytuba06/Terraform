#AWS route table associates

resource "aws_route_table_association" "my-rt-ass" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.my-rt.id
}
