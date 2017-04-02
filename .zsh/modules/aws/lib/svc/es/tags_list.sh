aws_es_tags_list() {
    local arn="$1"
    shift 1

    log_and_run aws es  --arn $arn "@"

}
