aws_rds_db_cluster_from_s3_restore() {
    local master-username="$1"
    local s3-ingestion-role-arn="$2"
    local source-engine="$3"
    local engine="$4"
    local db-cluster-identifier="$5"
    local source-engine-version="$6"
    local master-user-password="$7"
    local s3-bucket-name="$8"
    shift 8

    cond_log_and_run aws rds  --master-username $master_username --s3-ingestion-role-arn $s3_ingestion_role_arn --source-engine $source_engine --engine $engine --db-cluster-identifier $db_cluster_identifier --source-engine-version $source_engine_version --master-user-password $master_user_password --s3-bucket-name $s3_bucket_name "@"

}
