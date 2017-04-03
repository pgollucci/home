aws_swf_domain_describe() {
    local name="$1"
    shift 1

    log_and_run aws swf describe-domain --name $name "$@"
}
