

resource "aws_instance" "web" {
  ami           = "ami-04b762b4289fba92b"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.web_instance_profile.id}"
  key_name = "${var.ssh_key}"
  vpc_security_group_ids = [
    "${aws_security_group.web_sg.id}",
  ]
}

resource "aws_iam_instance_profile" "web_instance_profile" {
  name = "web_instance_profile"
  role = "${aws_iam_role.web_role.name}"
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}