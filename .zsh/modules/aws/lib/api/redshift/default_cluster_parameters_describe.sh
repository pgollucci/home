aws_redshift_default_cluster_parameters_describe() {
    local parameter_group_family="$1"
    shift 1

    log_and_run aws redshift describe-default-cluster-parameters --parameter-group-family $parameter_group_family "$@"
}
