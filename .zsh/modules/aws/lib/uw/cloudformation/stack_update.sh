aws_cloudformation_previous_template() {
        local stack_name="$1"
        shift 1

    cond_log_and_run aws cloudformation update-stack --stack-name $stack_name --use-previous-template "$@"
}

