aws_iam_mfa_device_deactivate() {
    local user-name="$1"
    local serial-number="$2"
    shift 2

    cond_log_and_run aws iam  --user-name $user_name --serial-number $serial_number "@"

}
