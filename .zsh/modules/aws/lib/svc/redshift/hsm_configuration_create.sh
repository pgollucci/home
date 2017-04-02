aws_redshift_hsm_configuration_create() {
    local description="$1"
    local hsm-ip-address="$2"
    local hsm-partition-name="$3"
    local hsm-configuration-identifier="$4"
    local hsm-server-public-certificate="$5"
    local hsm-partition-password="$6"
    shift 6

    cond_log_and_run aws redshift  --description $description --hsm-ip-address $hsm_ip_address --hsm-partition-name $hsm_partition_name --hsm-configuration-identifier $hsm_configuration_identifier --hsm-server-public-certificate $hsm_server_public_certificate --hsm-partition-password $hsm_partition_password "@"

}
