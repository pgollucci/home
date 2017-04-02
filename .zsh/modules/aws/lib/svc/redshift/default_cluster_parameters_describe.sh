aws_redshift_default_cluster_parameters_describe() {
    local parameter-group-family="$1"
    shift 1

    log_and_run aws redshift  --parameter-group-family $parameter_group_family "@"

}
