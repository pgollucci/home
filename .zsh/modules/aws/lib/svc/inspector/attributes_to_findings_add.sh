aws_inspector_attributes_to_findings_add() {
    local attributes="$1"
    local finding-arns="$2"
    shift 2

    cond_log_and_run aws inspector  --attributes $attributes --finding-arns $finding_arns "@"

}
