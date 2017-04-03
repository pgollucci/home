aws_inspector_rules_packages_describe() {
    local rules_package_arns="$1"
    shift 1

    log_and_run aws inspector describe-rules-packages --rules-package-arns $rules_package_arns "$@"
}
