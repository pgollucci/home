aws_discovery_application_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws discovery  --name $name "@"

}
