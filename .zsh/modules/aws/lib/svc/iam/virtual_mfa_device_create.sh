aws_iam_virtual_mfa_device_create() {
    local outfile="$1"
    local virtual-mfa-device-name="$2"
    local bootstrap-method="$3"
    shift 3

    cond_log_and_run aws iam  --outfile $outfile --virtual-mfa-device-name $virtual_mfa_device_name --bootstrap-method $bootstrap_method "@"

}
