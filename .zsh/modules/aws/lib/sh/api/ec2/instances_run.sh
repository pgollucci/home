aws_ec2_instances_run() {
    local image_id="$1"
    shift 1

    cond_log_and_run aws ec2 run-instances --image-id $image_id "$@"
}
