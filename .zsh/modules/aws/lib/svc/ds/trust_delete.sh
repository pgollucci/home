aws_ds_trust_delete() {
    local trust-id="$1"
    shift 1

    cond_log_and_run aws ds  --trust-id $trust_id "@"

}
