aws_stepfunctions_state_machine_create() {
    local name="$1"
    local definition="$2"
    local role-arn="$3"
    shift 3

    cond_log_and_run aws stepfunctions  --name $name --definition $definition --role-arn $role_arn "@"

}
