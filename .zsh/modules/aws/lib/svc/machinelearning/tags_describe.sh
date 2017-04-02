aws_machinelearning_tags_describe() {
    local resource-id="$1"
    local resource-type="$2"
    shift 2

    log_and_run aws machinelearning  --resource-id $resource_id --resource-type $resource_type "@"

}
