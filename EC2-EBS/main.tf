module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.5.0"

name = var.ec2
ami = data.aws_ami.amzlinux2.id
availability_zone = var.availability_zone
instance_type = var.instance_type

}

resource "aws_ebs_volume" "disk" {
  availability_zone = var.availability_zone
  size              = var.size

}

resource "aws_volume_attachment" "name" {
  device_name = var.device_name
  volume_id = aws_ebs_volume.disk.id
  instance_id = module.ec2_instance.id
}