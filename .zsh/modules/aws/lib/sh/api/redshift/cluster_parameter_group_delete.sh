aws_redshift_cluster_parameter_group_delete() {
    local parameter_group_name="$1"
    shift 1

    cond_log_and_run aws redshift delete-cluster-parameter-group --parameter-group-name $parameter_group_name "$@"
}
