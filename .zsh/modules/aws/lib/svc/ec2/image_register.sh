aws_ec2_image_register() {
    local name="$1"
    shift 1

    cond_log_and_run aws ec2  --name $name "@"

}
