aws_opsworks_app_create() {
    local stack_id="$1"
    local name="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws opsworks create-app --stack-id $stack_id --name $name --type $type "$@"
}
