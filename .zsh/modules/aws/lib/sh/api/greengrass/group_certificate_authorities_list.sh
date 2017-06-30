aws_greengrass_group_certificate_authorities_list() {
    local group_id="$1"
    shift 1

    log_and_run aws greengrass list-group-certificate-authorities --group-id $group_id "$@"
}
