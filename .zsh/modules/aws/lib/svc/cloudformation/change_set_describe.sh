aws_cloudformation_change_set_describe() {
    local change-set-name="$1"
    shift 1

    log_and_run aws cloudformation  --change-set-name $change_set_name "@"

}
