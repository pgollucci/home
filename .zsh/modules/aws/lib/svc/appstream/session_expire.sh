aws_appstream_session_expire() {
    local session-id="$1"
    shift 1

    cond_log_and_run aws appstream  --session-id $session_id "@"

}
