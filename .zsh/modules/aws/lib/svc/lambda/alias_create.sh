aws_lambda_alias_create() {
    local function-version="$1"
    local function-name="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws lambda  --function-version $function_version --function-name $function_name --name $name "@"

}
