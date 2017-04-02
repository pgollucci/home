aws_emr_security_configuration_describe() {
    local name="$1"
    shift 1

    log_and_run aws emr  --name $name "@"

}
