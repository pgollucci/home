aws_redshift_cluster_parameter_group_create() {
    local description="$1"
    local parameter-group-name="$2"
    local parameter-group-family="$3"
    shift 3

    cond_log_and_run aws redshift  --description $description --parameter-group-name $parameter_group_name --parameter-group-family $parameter_group_family "@"

}
