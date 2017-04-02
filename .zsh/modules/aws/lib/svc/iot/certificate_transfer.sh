aws_iot_certificate_transfer() {
    local target-aws-account="$1"
    local certificate-id="$2"
    shift 2

    cond_log_and_run aws iot  --target-aws-account $target_aws_account --certificate-id $certificate_id "@"

}
