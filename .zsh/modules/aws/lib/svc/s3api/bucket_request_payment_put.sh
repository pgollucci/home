aws_s3api_bucket_request_payment_put() {
    local request-payment-configuration="$1"
    local bucket="$2"
    shift 2

    cond_log_and_run aws s3api  --request-payment-configuration $request_payment_configuration --bucket $bucket "@"

}
