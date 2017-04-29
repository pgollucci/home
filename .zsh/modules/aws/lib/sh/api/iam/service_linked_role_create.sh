aws_iam_service_linked_role_create() {
    local aws_service_name="$1"
    shift 1

    cond_log_and_run aws iam create-service-linked-role --aws-service-name $aws_service_name "$@"
}
