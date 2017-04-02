aws_appstream_streaming_url_create() {
    local user-id="$1"
    local fleet-name="$2"
    local stack-name="$3"
    shift 3

    cond_log_and_run aws appstream  --user-id $user_id --fleet-name $fleet_name --stack-name $stack_name "@"

}
