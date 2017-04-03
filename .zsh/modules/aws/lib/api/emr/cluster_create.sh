aws_emr_cluster_create() {
    local release_label="$1"
    local instance_fleets="$2"
    shift 2

    cond_log_and_run aws emr create-cluster --release-label $release_label --instance-fleets $instance_fleets "$@"
}
