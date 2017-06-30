aws_dax_subnet_group_create() {
    local subnet_group_name="$1"
    local subnet_ids="$2"
    shift 2

    cond_log_and_run aws dax create-subnet-group --subnet-group-name $subnet_group_name --subnet-ids $subnet_ids "$@"
}
