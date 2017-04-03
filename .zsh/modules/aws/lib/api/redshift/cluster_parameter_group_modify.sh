aws_redshift_cluster_parameter_group_modify() {
    local parameter_group_name="$1"
    local parameters="$2"
    shift 2

    cond_log_and_run aws redshift modify-cluster-parameter-group --parameter-group-name $parameter_group_name --parameters $parameters "$@"
}
