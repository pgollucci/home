aws_ssm_instance_information_describe() {
    shift 0

    log_and_run aws ssm describe-instance-information "$@"
}
