aws_marketplacecommerceanalytics_support_data_export_start() {
    local role-name-arn="$1"
    local data-set-type="$2"
    local from-date="$3"
    local sns-topic-arn="$4"
    local destination-s3-bucket-name="$5"
    shift 5

    cond_log_and_run aws marketplacecommerceanalytics  --role-name-arn $role_name_arn --data-set-type $data_set_type --from-date $from_date --sns-topic-arn $sns_topic_arn --destination-s3-bucket-name $destination_s3_bucket_name "@"

}
