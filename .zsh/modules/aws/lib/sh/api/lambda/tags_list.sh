aws_lambda_tags_list() {
    local resource="$1"
    shift 1

    log_and_run aws lambda list-tags --resource $resource "$@"
}
