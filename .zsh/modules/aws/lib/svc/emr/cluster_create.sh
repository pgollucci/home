aws_emr_cluster_create() {
    local release-label="$1"
    local instance-fleets="$2"
    shift 2

    cond_log_and_run aws emr  --release-label $release_label --instance-fleets $instance_fleets "@"

}
