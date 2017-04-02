aws_iam_open_id_connect_provider_thumbprint_update() {
    local thumbprint-list="$1"
    local open-id-connect-provider-arn="$2"
    shift 2

    cond_log_and_run aws iam  --thumbprint-list $thumbprint_list --open-id-connect-provider-arn $open_id_connect_provider_arn "@"

}
