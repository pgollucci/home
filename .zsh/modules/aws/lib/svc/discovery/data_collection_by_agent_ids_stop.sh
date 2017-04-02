aws_discovery_data_collection_by_agent_ids_stop() {
    local agent-ids="$1"
    shift 1

    cond_log_and_run aws discovery  --agent-ids $agent_ids "@"

}
