aws_inspector_findings_describe() {
    local finding-arns="$1"
    shift 1

    log_and_run aws inspector  --finding-arns $finding_arns "@"

}
