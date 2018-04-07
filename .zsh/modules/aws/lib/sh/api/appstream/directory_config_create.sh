aws_appstream_directory_config_create() {
    local directory_name="$1"
    local organizational_unit_distinguished_names="$2"
    local service_account_credentials="$3"
    shift 3

    cond_log_and_run aws appstream create-directory-config --directory-name $directory_name --organizational-unit-distinguished-names $organizational_unit_distinguished_names --service-account-credentials $service_account_credentials "$@"
}
