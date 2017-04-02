aws_inspector_rules_packages_describe() {
    local rules-package-arns="$1"
    shift 1

    log_and_run aws inspector  --rules-package-arns $rules_package_arns "@"

}
