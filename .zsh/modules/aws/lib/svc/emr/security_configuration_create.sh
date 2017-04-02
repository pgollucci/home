aws_emr_security_configuration_create() {
    local name="$1"
    local security-configuration="$2"
    shift 2

    cond_log_and_run aws emr  --name $name --security-configuration $security_configuration "@"

}
