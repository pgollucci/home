aws_greengrass_service_role_from_account_disassociate() {

    cond_log_and_run aws greengrass disassociate-service-role-from-account "$@"
}
