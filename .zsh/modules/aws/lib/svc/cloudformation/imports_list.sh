aws_cloudformation_imports_list() {
    local export-name="$1"
    shift 1

    log_and_run aws cloudformation  --export-name $export_name "@"

}
