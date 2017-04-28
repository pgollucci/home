aws_ecs_attributes_put() {
    local attributes="$1"
    shift 1

    cond_log_and_run aws ecs put-attributes --attributes $attributes "$@"
}
