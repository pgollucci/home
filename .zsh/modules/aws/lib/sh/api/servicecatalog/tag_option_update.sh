aws_servicecatalog_tag_option_update() {
    local id="$1"
    shift 1

    cond_log_and_run aws servicecatalog update-tag-option --id $id "$@"
}
