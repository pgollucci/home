aws_datapipeline_expression_evaluate() {
    local object-id="$1"
    local pipeline-id="$2"
    local expression="$3"
    shift 3

    cond_log_and_run aws datapipeline  --object-id $object_id --pipeline-id $pipeline_id --expression $expression "@"

}
