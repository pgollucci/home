aws_ec2_identity_id_format_describe() {
    local principal_arn="$1"
    shift 1

    log_and_run aws ec2 describe-identity-id-format --principal-arn $principal_arn "$@"
}
