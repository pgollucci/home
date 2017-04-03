aws_ecs_cluster_delete() {
    local cluster="$1"
    shift 1

    cond_log_and_run aws ecs delete-cluster --cluster $cluster "$@"
}
