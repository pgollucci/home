aws_redshift_logging_enable() {
    local bucket-name="$1"
    local cluster-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --bucket-name $bucket_name --cluster-identifier $cluster_identifier "@"

}
