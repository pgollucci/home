aws_logs_export_task_create() {
    local to="$1"
    local from="$2"
    local destination="$3"
    local log-group-name="$4"
    shift 4

    cond_log_and_run aws logs  --to $to --from $from --destination $destination --log-group-name $log_group_name "@"

}
