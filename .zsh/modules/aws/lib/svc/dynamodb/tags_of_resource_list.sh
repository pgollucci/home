aws_dynamodb_tags_of_resource_list() {
    local resource-arn="$1"
    shift 1

    log_and_run aws dynamodb  --resource-arn $resource_arn "@"

}
