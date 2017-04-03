aws_shield_protections_list() {
    shift 0

    log_and_run aws shield list-protections "$@"
}
