resource "aws_ebs_volume" "data_volume" {
  availability_zone = aws_subnet.main.availability_zone
  size              = 100
  type              = "gp3"

  tags = {
    Name = "dev-data-volume"
  }
}
