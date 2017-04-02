aws_ssm_parameter_put() {
    local name="$1"
    local value="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws ssm  --name $name --value $value --type $type "@"

}
