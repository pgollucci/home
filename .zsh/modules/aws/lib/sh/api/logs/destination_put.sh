aws_logs_destination_put() {
    local destination_name="$1"
    local target_arn="$2"
    local role_arn="$3"
    shift 3

    cond_log_and_run aws logs put-destination --destination-name $destination_name --target-arn $target_arn --role-arn $role_arn "$@"
}
