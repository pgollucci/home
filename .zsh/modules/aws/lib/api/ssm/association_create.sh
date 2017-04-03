aws_ssm_association_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws ssm create-association --name $name "$@"
}
