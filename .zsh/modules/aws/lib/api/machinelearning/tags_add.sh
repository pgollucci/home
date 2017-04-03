aws_machinelearning_tags_add() {
    local tags="$1"
    local resource_id="$2"
    local resource_type="$3"
    shift 3

    cond_log_and_run aws machinelearning add-tags --tags $tags --resource-id $resource_id --resource-type $resource_type "$@"
}
