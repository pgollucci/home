aws_inspector_attributes_from_findings_remove() {
    local finding-arns="$1"
    local attribute-keys="$2"
    shift 2

    cond_log_and_run aws inspector  --finding-arns $finding_arns --attribute-keys $attribute_keys "@"

}
