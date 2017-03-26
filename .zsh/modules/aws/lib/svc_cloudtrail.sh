aws_cloudtrail_trail_make() {
    local org="$1"
    local account_id="$2"
    local trail_full_path="$3"
    local s3_arns="$4"

    local trail_full_path_tr=$(transliterate "$trail_full_path" "/" "-")
    local trail_bucket=$trail_full_path_tr
    aws_s3_mb "$trail_bucket"
    aws_s3_cloudtrail_policy_attach "$trail_bucket" "$account_id"

    local trail_topic_name=$trail_full_path_tr
    aws_sns_topic_create "$trail_topic_name"

    local trail_kms_key_id=$(aws_kms_key_make "$account_id" "CloudTrail" "alias/$org/cloudtrail/encrypt_decrypt")

    local trail_logs_group_name=$trail_full_path_tr
    local cloudwatch_logs_group_arn=$(aws_cloudwatch_logs_group_make "$trail_log_group_name")

    local trail_logs_group_arn="arn:aws:logs::${account_id}:log-group:${trail_logs_group_name}:log-stream:${account_id}_CloudTrail_*"
    local cloudwatch_logs_role_arn=$(aws_cloudtrail_trail_iam "$trail_full_path" "$trail_description" "$trail_logs_group_arn" "$account_id")

    aws_cloudtrail_create "$trail_full_path" "$trail_bucket" "$trail_topic_name"

    aws_cloudtrail_include_global_events "$trail_full_path"
    aws_cloudtrail_is_multi_region "$trail_full_path"
    aws_cloudtrail_enable_log_file_validation "$trail_full_path"
    aws_cloudtrail_data_events "$trail_full_path" "$s3_arns"
    aws_cloudtrail_kms_encrypt "$trail_full_path" "$trail_kms_key_id"

    aws_cloudtrail_2_sns "$trail_full_path" "$trail_topic_name"
    aws_cloudtrail_2_cloudwatch "$trail_full_path" "$cloudwatch_logs_group_arn" "$cloudwatch_logs_role_arn"

    aws_cloudtrail_logging_start "$trail_full_path"
}

aws_cloudtrail_trail_iam() {
    local trail_full_path="$1"
    local trail_description="$2"
    local trail_logs_group_arn="$3"
    local account_id="$4"

    local assume_role_policy_document=$(aws_iam_policy_service_write "cloudtrail")
    aws_iam_role_create "$trail_full_path" "$assume_role_policy_document"

    local cloudtrail_policy_document=$(aws_iam_policy_cloudtrail_write "$trail_logs_group_arn")
    local cloudtrail_policy_arn=$(aws_iam_policy_create "$trail_full_path" "$trail_description" "$cloudtrail_policy_document")
    aws_iam_policy_to_role "$trail_full_path" "$cloudtrail_policy_arn"
}

aws_cloudtrail_create() {
    local trail_full_path="$1"
    local trail_bucket="$2"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail create-trail --name $trail_name --s3-bucket $trail_bucket
}

aws_cloudtrail_include_global_events() {
    local trail_full_path="$1"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail update-trail --name $trail_name --include-global-service-events true
}

aws_cloudtrail_data_events() {
    local trail_full_path="$1"
    local s3_arns="$2"

    local trail_name=$(uri_parse_name "$trail_full_path")

    local event_selectors=$(aws_cloudtrail_event_selector_write "$s3_arns")

    aws cloudtrail put-event-selectors --trail-name $trail_name --event-selectors $event_selectors
}

aws_cloudtrail_logging_start() {
    local trail_full_path="$1"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail start-logging --name $trail_name
}

aws_cloudtrail_is_multi_region() {
    local trail_full_path="$1"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail update-trail --name $trail_name --is-multi-region-trail
}

aws_cloudtrail_enable_log_file_validation() {
    local trail_full_path="$1"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail update-trail --name $trail_name --enable-log-file-validation
}

aws_cloudtrail_2_cloudwatch() {
    local trail_full_path="$1"
    local log_groups_arn="$2"
    local role_arn="$3"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail update-trail --name $trail_name --cloud-watch-logs-log-group-arn $logs_group_arn --cloud-watch-logs-role-arn $role_arn
}

aws_cloudtrail_2_sns() {
    local trail_full_path="$1"
    local sns_topic_name="$2"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail update-trail --name $trail_name --sns-topic-name $sns_topic_name
}

aws_cloudtrail_kms_encrypt() {
    local trail_full_path="$1"
    local trail_kms_key_id="$2"

    local trail_name=$(uri_parse_name "$trail_full_path")

    aws cloudtrail update-trail --name trail_name --kms-key-id $trail_kms_key_id
}

aws_cloudtrail_event_selector_write() {
    local s3_arns="$1"

    aws_iam_template_process "iam/cloudtrail_events" "S3_ARNS=$s3_arns"
}
