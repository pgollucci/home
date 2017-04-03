aws_elastictranscoder_pipeline_create() {
    local name="$1"
    local input_bucket="$2"
    local role="$3"
    shift 3

    cond_log_and_run aws elastictranscoder create-pipeline --name $name --input-bucket $input_bucket --role $role "$@"
}
