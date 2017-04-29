aws_codestar_project_describe() {
    local id="$1"
    shift 1

    log_and_run aws codestar describe-project --id $id "$@"
}
