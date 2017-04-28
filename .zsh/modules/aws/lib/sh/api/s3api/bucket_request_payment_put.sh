aws_s3api_bucket_request_payment_put() {
    local bucket="$1"
    local request_payment_configuration="$2"
    shift 2

    cond_log_and_run aws s3api put-bucket-request-payment --bucket $bucket --request-payment-configuration $request_payment_configuration "$@"
}
