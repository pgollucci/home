aws_dynamodb_tags_of_resource_list() {
    local resource_arn="$1"
    shift 1

    log_and_run aws dynamodb list-tags-of-resource --resource-arn $resource_arn "$@"
}
