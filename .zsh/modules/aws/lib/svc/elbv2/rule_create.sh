aws_elbv2_rule_create() {
    local listener-arn="$1"
    local priority="$2"
    local actions="$3"
    local conditions="$4"
    shift 4

    cond_log_and_run aws elbv2  --listener-arn $listener_arn --priority $priority --actions $actions --conditions $conditions "@"

}
