aws_iam_open_id_connect_provider_thumbprint_update() {
    local open_id_connect_provider_arn="$1"
    local thumbprint_list="$2"
    shift 2

    cond_log_and_run aws iam update-open-id-connect-provider-thumbprint --open-id-connect-provider-arn $open_id_connect_provider_arn --thumbprint-list $thumbprint_list "$@"
}
