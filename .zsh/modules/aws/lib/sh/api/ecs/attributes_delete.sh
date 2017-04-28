aws_ecs_attributes_delete() {
    local attributes="$1"
    shift 1

    cond_log_and_run aws ecs delete-attributes --attributes $attributes "$@"
}
