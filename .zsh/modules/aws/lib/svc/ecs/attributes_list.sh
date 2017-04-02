aws_ecs_attributes_list() {
    local target-type="$1"
    shift 1

    log_and_run aws ecs  --target-type $target_type "@"

}
