aws_dynamodb_resource_untag() {
    local resource-arn="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws dynamodb  --resource-arn $resource_arn --tag-keys $tag_keys "@"

}
