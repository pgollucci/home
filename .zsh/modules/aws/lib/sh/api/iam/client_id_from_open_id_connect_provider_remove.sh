aws_iam_client_id_from_open_id_connect_provider_remove() {
    local open_id_connect_provider_arn="$1"
    local client_id="$2"
    shift 2

    cond_log_and_run aws iam remove-client-id-from-open-id-connect-provider --open-id-connect-provider-arn $open_id_connect_provider_arn --client-id $client_id "$@"
}
