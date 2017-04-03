aws_inspector_attributes_to_findings_add() {
    local finding_arns="$1"
    local attributes="$2"
    shift 2

    cond_log_and_run aws inspector add-attributes-to-findings --finding-arns $finding_arns --attributes $attributes "$@"
}
