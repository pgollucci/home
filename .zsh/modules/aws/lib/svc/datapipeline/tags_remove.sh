aws_datapipeline_tags_remove() {
    local tag-keys="$1"
    local pipeline-id="$2"
    shift 2

    cond_log_and_run aws datapipeline  --tag-keys $tag_keys --pipeline-id $pipeline_id "@"

}
