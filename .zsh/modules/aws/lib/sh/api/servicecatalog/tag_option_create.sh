aws_servicecatalog_tag_option_create() {
    local key="$1"
    local value="$2"
    shift 2

    cond_log_and_run aws servicecatalog create-tag-option --key $key --value $value "$@"
}
