aws_cloudwatch_logs_group_make() {
    local logs_group_name="$1"

    aws logs create-log-group --log-group-name $logs_group_name

    aws --output text logs describe-log-groups --log-group-name-prefix "$name" --query "logGroups[].arn"
}
