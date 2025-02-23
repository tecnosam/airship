# Pilot: t4g.nano for automation and control
resource "aws_instance" "pilot" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t4g.nano"
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  associate_public_ip_address = true
  ipv6_address_count          = 1

  tags = {
    Name = "Pilot"
  }

  user_data = file("${path.module}/scripts/pilot.sh")
}

# Instance: t3.medium for day-to-day coding (~10 hours/day)
resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  associate_public_ip_address = true
  ipv6_address_count          = 1

  tags = {
    Name = "Instance"
  }

  user_data = file("${path.module}/scripts/instance.sh")
}
