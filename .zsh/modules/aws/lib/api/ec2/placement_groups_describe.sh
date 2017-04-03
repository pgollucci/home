aws_ec2_placement_groups_describe() {
    shift 0

    log_and_run aws ec2 describe-placement-groups "$@"
}
