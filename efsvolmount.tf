#mounting efs volume to instance
resource "null_resource" "mount_vol" {
	connection {
		type        = "ssh"
		user        = "ec2-user"
		private_key = tls_private_key.tfkey.private_key_pem
		host        = aws_instance.taskos.public_ip
	}

	provisioner "remote-exec" {
		inline = [
			"sudo echo ${aws_efs_file_system.efs.id}:/ /var/www/html efs defaults,_netdev 0 0 >> sudo /etc/fstab",
			"sudo mount -t efs ${aws_efs_file_system.efs.id}:/ /var/www/html",
			"sudo curl  https://github.com/SaiSundarMasetty/html/blob/master/html1.html > html1.html",
			"sudo cp html1.html /var/www/html/"
		]
	}
	depends_on = [
		aws_instance.taskos,
		aws_efs_file_system.efs,
		aws_efs_mount_target.efsmount,
	]
}