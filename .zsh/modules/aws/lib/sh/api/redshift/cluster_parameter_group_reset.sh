aws_redshift_cluster_parameter_group_reset() {
    local parameter_group_name="$1"
    shift 1

    cond_log_and_run aws redshift reset-cluster-parameter-group --parameter-group-name $parameter_group_name "$@"
}
