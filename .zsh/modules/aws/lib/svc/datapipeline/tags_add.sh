aws_datapipeline_tags_add() {
    local pipeline-id="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws datapipeline  --pipeline-id $pipeline_id --tags $tags "@"

}
