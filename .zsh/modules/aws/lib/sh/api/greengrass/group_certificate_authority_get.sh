aws_greengrass_group_certificate_authority_get() {
    local certificate_authority_id="$1"
    local group_id="$2"
    shift 2

    log_and_run aws greengrass get-group-certificate-authority --certificate-authority-id $certificate_authority_id --group-id $group_id "$@"
}
