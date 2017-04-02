aws_marketplacecommerceanalytics_data_set_generate() {
    local destination-s3-bucket-name="$1"
    local sns-topic-arn="$2"
    local role-name-arn="$3"
    local data-set-type="$4"
    local data-set-publication-date="$5"
    shift 5

    cond_log_and_run aws marketplacecommerceanalytics  --destination-s3-bucket-name $destination_s3_bucket_name --sns-topic-arn $sns_topic_arn --role-name-arn $role_name_arn --data-set-type $data_set_type --data-set-publication-date $data_set_publication_date "@"

}
