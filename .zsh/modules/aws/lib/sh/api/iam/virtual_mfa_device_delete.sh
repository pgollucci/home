aws_iam_virtual_mfa_device_delete() {
    local serial_number="$1"
    shift 1

    cond_log_and_run aws iam delete-virtual-mfa-device --serial-number $serial_number "$@"
}
