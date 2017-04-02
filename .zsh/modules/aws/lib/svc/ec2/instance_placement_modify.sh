aws_ec2_instance_placement_modify() {
    local instance-id="$1"
    shift 1

    cond_log_and_run aws ec2  --instance-id $instance_id "@"

}
