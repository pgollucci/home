aws_cloudformation_previous_template() {
        local stack_set_name="$1"
        shift 1

    cond_log_and_run aws cloudformation update-stack-set --stack-set-name $stack_set_name --use-previous-template "$@"
}

