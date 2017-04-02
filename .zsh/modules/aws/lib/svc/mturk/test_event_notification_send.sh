aws_mturk_test_event_notification_send() {
    local notification="$1"
    local test-event-type="$2"
    shift 2

    cond_log_and_run aws mturk  --notification $notification --test-event-type $test_event_type "@"

}
