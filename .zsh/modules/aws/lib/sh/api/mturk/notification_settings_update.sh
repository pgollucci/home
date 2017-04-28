aws_mturk_notification_settings_update() {
    local hit_type_id="$1"
    shift 1

    cond_log_and_run aws mturk update-notification-settings --hit-type-id $hit_type_id "$@"
}
