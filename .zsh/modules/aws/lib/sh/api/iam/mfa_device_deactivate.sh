aws_iam_mfa_device_deactivate() {
    local user_name="$1"
    local serial_number="$2"
    shift 2

    cond_log_and_run aws iam deactivate-mfa-device --user-name $user_name --serial-number $serial_number "$@"
}
