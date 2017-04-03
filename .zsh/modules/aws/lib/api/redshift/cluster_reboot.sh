aws_redshift_cluster_reboot() {
    local cluster_identifier="$1"
    shift 1

    cond_log_and_run aws redshift reboot-cluster --cluster-identifier $cluster_identifier "$@"
}
