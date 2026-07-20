
resource "aws_s3_bucket" "static-site-bucket" {
  bucket = "KaneMS97-website-bucket"
}

resource "aws_s3_object" "htmlindex" {
  bucket = aws_s3_bucket.static-site-bucket.id
  for_each = fileset("C:\\Users\\Kane\\Documents\\Terraform\\Cloud_Resume\\ResumeSite","*")
  key = each.value
  source = "C:\\Users\\Kane\\Documents\\Terraform\\Cloud_Resume\\ResumeSite\\${each.value}"
}

##resource "aws_cloudfront_distribution" "website_distribution" {
##  origin {
##    domain_name = aws_s3_bucket.static-site-bucket
##    origin_id = 
##    s3_origin_config {
##      origin_access_identity = 
##    }
##  }
##}