aws_iam_virtual_mfa_device_create() {
    local virtual_mfa_device_name="$1"
    local outfile="$2"
    local bootstrap_method="$3"
    shift 3

    cond_log_and_run aws iam create-virtual-mfa-device --virtual-mfa-device-name $virtual_mfa_device_name --outfile $outfile --bootstrap-method $bootstrap_method "$@"
}
