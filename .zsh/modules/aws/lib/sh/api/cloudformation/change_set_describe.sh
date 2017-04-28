aws_cloudformation_change_set_describe() {
    local change_set_name="$1"
    shift 1

    log_and_run aws cloudformation describe-change-set --change-set-name $change_set_name "$@"
}
