aws_ecs_attributes_list() {
    local target_type="$1"
    shift 1

    log_and_run aws ecs list-attributes --target-type $target_type "$@"
}
