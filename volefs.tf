#creating efs
resource "aws_efs_file_system" "efs" {
	creation_token = "efs"
	tags = {
		Name = "efs"
	}
	depends_on = [
		aws_instance.taskos
	]
}