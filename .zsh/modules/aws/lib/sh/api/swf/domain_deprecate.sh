aws_swf_domain_deprecate() {
    local name="$1"
    shift 1

    cond_log_and_run aws swf deprecate-domain --name $name "$@"
}
