aws_logs_destination_put() {
    local destination-name="$1"
    local target-arn="$2"
    local role-arn="$3"
    shift 3

    cond_log_and_run aws logs  --destination-name $destination_name --target-arn $target_arn --role-arn $role_arn "@"

}
