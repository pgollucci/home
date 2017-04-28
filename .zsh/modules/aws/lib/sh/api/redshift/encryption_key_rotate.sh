aws_redshift_encryption_key_rotate() {
    local cluster_identifier="$1"
    shift 1

    cond_log_and_run aws redshift rotate-encryption-key --cluster-identifier $cluster_identifier "$@"
}
