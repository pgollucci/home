aws_elasticache_snapshots_describe() {
    shift 0

    log_and_run aws elasticache describe-snapshots "$@"
}
