aws_s3_cloudtrail_policy_attach() {
    local trail_bucket="$1"
    local account_id="$2"

    local s3_policy_document=$(aws_iam_policy_s3_cloudtrail_write "$trail_bucket" "$account_id")

    aws_s3api_policy_to_bucket "$trail_bucket" "$s3_policy_document"
}

aws_s3api_policy_to_bucket() {
    local bucket_name="$1"
    local bucket_policy="$2"

    aws s3api put-bucket-policy --bucket $bucket_name --policy $bucket_policy
}

aws_s3_sync() {
    local src="$1"
    local dst_bucket="$2"
    local dst_folder="$3"

    aws s3 sync --sse AES256 ${src} s3://${dst_bucket}/${dst_folder}
}

aws_s3_cp() {
    local src="$1"
    local dst_bucket="$2"
    local dst_folder="$3"

    aws s3 cp --sse AES256 ${src} s3://${dst_bucket}/${dst_folder}
}

aws_s3_mb() {
    local s3uri="$1"

    aws s3 mb s3://${s3uri}
}

aws_s3_rb() {
    local s3uri="$1"

    aws s3 rb s3://${s3uri} --force
}
