aws_discovery_data_collection_by_agent_ids_start() {
    local agent_ids="$1"
    shift 1

    cond_log_and_run aws discovery start-data-collection-by-agent-ids --agent-ids $agent_ids "$@"
}
