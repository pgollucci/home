aws_health_affected_entities_describe() {
    local filter="$1"
    shift 1

    log_and_run aws health describe-affected-entities --filter $filter "$@"
}
