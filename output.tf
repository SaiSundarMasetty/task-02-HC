resource "null_resource" "StartBrowsing" {
	provisioner "local-exec" {
		command = "start msedge ${aws_instance.taskos.public_ip}"
	}
	depends_on = [
		null_resource.mod
	]
}