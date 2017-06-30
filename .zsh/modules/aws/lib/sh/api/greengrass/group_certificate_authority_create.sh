aws_greengrass_group_certificate_authority_create() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass create-group-certificate-authority --group-id $group_id "$@"
}
