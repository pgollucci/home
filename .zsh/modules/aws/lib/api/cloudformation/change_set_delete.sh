aws_cloudformation_change_set_delete() {
    local change_set_name="$1"
    shift 1

    cond_log_and_run aws cloudformation delete-change-set --change-set-name $change_set_name "$@"
}
