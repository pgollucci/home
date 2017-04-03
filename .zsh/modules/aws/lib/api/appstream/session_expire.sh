aws_appstream_session_expire() {
    local session_id="$1"
    shift 1

    cond_log_and_run aws appstream expire-session --session-id $session_id "$@"
}
