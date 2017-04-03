aws_redshift_hsm_configuration_create() {
    local hsm_configuration_identifier="$1"
    local description="$2"
    local hsm_ip_address="$3"
    local hsm_partition_name="$4"
    local hsm_partition_password="$5"
    local hsm_server_public_certificate="$6"
    shift 6

    cond_log_and_run aws redshift create-hsm-configuration --hsm-configuration-identifier $hsm_configuration_identifier --description $description --hsm-ip-address $hsm_ip_address --hsm-partition-name $hsm_partition_name --hsm-partition-password $hsm_partition_password --hsm-server-public-certificate $hsm_server_public_certificate "$@"
}
