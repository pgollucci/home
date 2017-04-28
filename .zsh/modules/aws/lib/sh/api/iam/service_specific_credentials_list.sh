aws_iam_service_specific_credentials_list() {

    log_and_run aws iam list-service-specific-credentials "$@"
}
