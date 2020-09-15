#modifying
resource "null_resource" "mod" {
	connection {
		type     	= "ssh"
		user     	= "ec2-user"
		private_key = tls_private_key.tfkey.private_key_pem
		host        = aws_instance.taskos.public_ip
	}

	provisioner "remote-exec" {
		inline	= [
			"sudo sed -i 's@thankyou.jpg@https://${aws_cloudfront_distribution.distribution.domain_name}/thankyou.jpg@g' /var/www/html/html1.html"
		]
	}
	depends_on = [
		aws_cloudfront_distribution.distribution
	]
}
output "Public_IP" {
	value = "${aws_instance.taskos.public_ip}"
}