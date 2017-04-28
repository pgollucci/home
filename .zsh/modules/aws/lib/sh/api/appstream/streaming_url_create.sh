aws_appstream_streaming_url_create() {
    local stack_name="$1"
    local fleet_name="$2"
    local user_id="$3"
    shift 3

    cond_log_and_run aws appstream create-streaming-url --stack-name $stack_name --fleet-name $fleet_name --user-id $user_id "$@"
}
