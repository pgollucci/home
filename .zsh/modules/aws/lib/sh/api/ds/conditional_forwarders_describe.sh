aws_ds_conditional_forwarders_describe() {
    local directory_id="$1"
    shift 1

    log_and_run aws ds describe-conditional-forwarders --directory-id $directory_id "$@"
}
