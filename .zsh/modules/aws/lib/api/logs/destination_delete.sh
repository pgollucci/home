aws_logs_destination_delete() {
    local destination_name="$1"
    shift 1

    cond_log_and_run aws logs delete-destination --destination-name $destination_name "$@"
}
