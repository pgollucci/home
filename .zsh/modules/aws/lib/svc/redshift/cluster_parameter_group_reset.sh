aws_redshift_cluster_parameter_group_reset() {
    local parameter-group-name="$1"
    shift 1

    cond_log_and_run aws redshift  --parameter-group-name $parameter_group_name "@"

}
