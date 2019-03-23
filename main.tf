provider "aws" {
    region = "ca-central-1"
}

resource "aws_instance" "example" {
    ami = "ami-992fa9fd"
    instance_type = "t2.micro"
    
    tags {
        Name = "kenny-tesst"
    }
}