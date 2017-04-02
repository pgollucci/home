aws_opsworks_app_create() {
    local name="$1"
    local stack-id="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws opsworks  --name $name --stack-id $stack_id --type $type "@"

}
