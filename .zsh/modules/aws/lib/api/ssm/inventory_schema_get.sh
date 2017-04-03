aws_ssm_inventory_schema_get() {
    shift 0

    log_and_run aws ssm get-inventory-schema "$@"
}
