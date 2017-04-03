aws_redshift_logging_enable() {
    local cluster_identifier="$1"
    local bucket_name="$2"
    shift 2

    cond_log_and_run aws redshift enable-logging --cluster-identifier $cluster_identifier --bucket-name $bucket_name "$@"
}
