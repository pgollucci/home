aws_ec2_image_import() {

    cond_log_and_run aws ec2 import-image "$@"
}
