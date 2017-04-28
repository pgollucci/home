aws_lambda_version_publish() {
    local function_name="$1"
    shift 1

    cond_log_and_run aws lambda publish-version --function-name $function_name "$@"
}
