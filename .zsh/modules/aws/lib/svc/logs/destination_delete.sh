aws_logs_destination_delete() {
    local destination-name="$1"
    shift 1

    cond_log_and_run aws logs  --destination-name $destination_name "@"

}
