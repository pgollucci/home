aws_ec2_tags_create() {
    local resources="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws ec2 create-tags --resources $resources --tags $tags "$@"
}
