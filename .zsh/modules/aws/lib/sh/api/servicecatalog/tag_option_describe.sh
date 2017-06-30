aws_servicecatalog_tag_option_describe() {
    local id="$1"
    shift 1

    log_and_run aws servicecatalog describe-tag-option --id $id "$@"
}
