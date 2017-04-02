aws_iam_open_id_connect_provider_get() {
    local open-id-connect-provider-arn="$1"
    shift 1

    log_and_run aws iam  --open-id-connect-provider-arn $open_id_connect_provider_arn "@"

}
