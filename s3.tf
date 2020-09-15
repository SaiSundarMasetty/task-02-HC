#creating s3 bucket and uploading

resource "aws_s3_bucket" "bucket1" {
	bucket = "hellobuck123654"
	acl    = "public-read"

	tags = {
		Name = "bucket"
	}

	depends_on = [
		null_resource.mount_vol
	]
}

resource "aws_s3_bucket_object" "objectstor" {
	bucket       = aws_s3_bucket.bucket1.bucket
	key          = "thank-you-image.png"
	source       = "C:/Users/SaiSundarMasetty/Pictures/thank-you-image.png"
	content_type = "image/jpg"
	acl          = "public-read"
    

	depends_on = [
		aws_s3_bucket.bucket1
	]
}