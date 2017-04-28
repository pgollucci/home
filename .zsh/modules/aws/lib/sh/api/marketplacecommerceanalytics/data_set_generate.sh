aws_marketplacecommerceanalytics_data_set_generate() {
    local data_set_type="$1"
    local data_set_publication_date="$2"
    local role_name_arn="$3"
    local destination_s3_bucket_name="$4"
    local sns_topic_arn="$5"
    shift 5

    cond_log_and_run aws marketplacecommerceanalytics generate-data-set --data-set-type $data_set_type --data-set-publication-date $data_set_publication_date --role-name-arn $role_name_arn --destination-s3-bucket-name $destination_s3_bucket_name --sns-topic-arn $sns_topic_arn "$@"
}
