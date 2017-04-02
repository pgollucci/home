aws_appstream_associated_fleets_list() {
    local stack-name="$1"
    shift 1

    log_and_run aws appstream  --stack-name $stack_name "@"

}
