aws_emr_security_configuration_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws emr  --name $name "@"

}
