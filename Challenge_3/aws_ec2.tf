resource "aws_instance" "citadel" {
  ami                       = "ami-06178cf087598769c"
  instance_type             = "m5.large"
  key_name                  = aws_key_pair.citadel-key.id
  user_data                 = file("/root/terraform-challenges/project-citadel/install-nginx.sh")
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.citadel.id
  allocation_id = aws_eip.eip.id
}