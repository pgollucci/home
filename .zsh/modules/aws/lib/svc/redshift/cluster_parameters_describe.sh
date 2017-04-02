aws_redshift_cluster_parameters_describe() {
    local parameter-group-name="$1"
    shift 1

    log_and_run aws redshift  --parameter-group-name $parameter_group_name "@"

}
