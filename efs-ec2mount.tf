#mounting efs to ec2
resource "aws_efs_mount_target" "efsmount" {
	file_system_id = aws_efs_file_system.efs.id
	subnet_id      = aws_subnet.subnet_pub.id
	security_groups = [aws_security_group.sg_pub.id]
	
	depends_on = [
		aws_efs_file_system.efs
	]
}