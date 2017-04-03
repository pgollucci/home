aws_opsworks_layer_create() {
    local stack_id="$1"
    local type="$2"
    local name="$3"
    local shortname="$4"
    shift 4

    cond_log_and_run aws opsworks create-layer --stack-id $stack_id --type $type --name $name --shortname $shortname "$@"
}
