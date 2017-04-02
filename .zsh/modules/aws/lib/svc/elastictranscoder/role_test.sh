aws_elastictranscoder_role_test() {
    local input-bucket="$1"
    local output-bucket="$2"
    local topics="$3"
    local role="$4"
    shift 4

    cond_log_and_run aws elastictranscoder  --input-bucket $input_bucket --output-bucket $output_bucket --topics $topics --role $role "@"

}
