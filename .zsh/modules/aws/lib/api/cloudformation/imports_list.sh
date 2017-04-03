aws_cloudformation_imports_list() {
    local export_name="$1"
    shift 1

    log_and_run aws cloudformation list-imports --export-name $export_name "$@"
}
