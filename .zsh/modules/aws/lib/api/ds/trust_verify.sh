aws_ds_trust_verify() {
    local trust_id="$1"
    shift 1

    cond_log_and_run aws ds verify-trust --trust-id $trust_id "$@"
}
