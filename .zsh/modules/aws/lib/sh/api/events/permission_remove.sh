aws_events_permission_remove() {
    local statement_id="$1"
    shift 1

    cond_log_and_run aws events remove-permission --statement-id $statement_id "$@"
}
