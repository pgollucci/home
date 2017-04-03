aws_opsworks_custom_cookbooks() {
        local stack_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-stack --stack-id $stack_id --use-custom-cookbooks "$@"
}

aws_opsworks_opsworks_security_groups() {
        local stack_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-stack --stack-id $stack_id --use-opsworks-security-groups "$@"
}

