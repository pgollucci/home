aws_iam_mfa_devices_list() {

    log_and_run aws iam list-mfa-devices "$@"
}
