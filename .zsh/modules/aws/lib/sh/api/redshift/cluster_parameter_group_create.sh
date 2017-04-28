aws_redshift_cluster_parameter_group_create() {
    local parameter_group_name="$1"
    local parameter_group_family="$2"
    local description="$3"
    shift 3

    cond_log_and_run aws redshift create-cluster-parameter-group --parameter-group-name $parameter_group_name --parameter-group-family $parameter_group_family --description $description "$@"
}
