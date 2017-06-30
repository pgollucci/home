aws_dax_subnet_group_update() {
    local subnet_group_name="$1"
    shift 1

    cond_log_and_run aws dax update-subnet-group --subnet-group-name $subnet_group_name "$@"
}
