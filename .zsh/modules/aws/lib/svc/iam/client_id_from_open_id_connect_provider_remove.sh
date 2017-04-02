aws_iam_client_id_from_open_id_connect_provider_remove() {
    local client-id="$1"
    local open-id-connect-provider-arn="$2"
    shift 2

    cond_log_and_run aws iam  --client-id $client_id --open-id-connect-provider-arn $open_id_connect_provider_arn "@"

}
