aws_appstream_associated_fleets_list() {
    local stack_name="$1"
    shift 1

    log_and_run aws appstream list-associated-fleets --stack-name $stack_name "$@"
}
