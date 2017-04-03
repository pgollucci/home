aws_sts_federation_token_get() {
    local name="$1"
    shift 1

    log_and_run aws sts get-federation-token --name $name "$@"
}
