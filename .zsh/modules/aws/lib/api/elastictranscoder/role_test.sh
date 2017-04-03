aws_elastictranscoder_role_test() {
    local role="$1"
    local input_bucket="$2"
    local output_bucket="$3"
    local topics="$4"
    shift 4

    cond_log_and_run aws elastictranscoder test-role --role $role --input-bucket $input_bucket --output-bucket $output_bucket --topics $topics "$@"
}
