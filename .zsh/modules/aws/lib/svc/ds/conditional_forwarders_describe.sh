aws_ds_conditional_forwarders_describe() {
    local directory-id="$1"
    shift 1

    log_and_run aws ds  --directory-id $directory_id "@"

}
