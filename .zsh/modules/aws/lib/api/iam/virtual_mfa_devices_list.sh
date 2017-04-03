aws_iam_virtual_mfa_devices_list() {
    shift 0

    log_and_run aws iam list-virtual-mfa-devices "$@"
}
