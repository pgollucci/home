aws_opsworks_layer_create() {
    local type="$1"
    local stack-id="$2"
    local shortname="$3"
    local name="$4"
    shift 4

    cond_log_and_run aws opsworks  --type $type --stack-id $stack_id --shortname $shortname --name $name "@"

}
