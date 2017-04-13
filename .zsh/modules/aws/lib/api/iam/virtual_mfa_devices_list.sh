aws_iam_virtual_mfa_devices_list() {

    log_and_run aws iam list-virtual-mfa-devices "$@"
}
