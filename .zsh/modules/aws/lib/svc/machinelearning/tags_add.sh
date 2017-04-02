aws_machinelearning_tags_add() {
    local resource-type="$1"
    local resource-id="$2"
    local tags="$3"
    shift 3

    cond_log_and_run aws machinelearning  --resource-type $resource_type --resource-id $resource_id --tags $tags "@"

}
