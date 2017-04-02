aws_ec2_tags_create() {
    local tags="$1"
    local resources="$2"
    shift 2

    cond_log_and_run aws ec2  --tags $tags --resources $resources "@"

}
