aws_ds_trust_delete() {
    local trust_id="$1"
    shift 1

    cond_log_and_run aws ds delete-trust --trust-id $trust_id "$@"
}
