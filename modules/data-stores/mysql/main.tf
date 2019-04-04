resource "aws_db_instance" "example" {
  engine = "mysql"
  allocated_storage = "${var.allocated_storage}"
  instance_class = "db.t2.micro"
  name = "${var.name}"
  username = "${var.username}"
  password = "${var.password}"
  skip_final_snapshot = true
}