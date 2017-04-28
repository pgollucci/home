aws_rds_db_cluster_from_s3_restore() {
    local db_cluster_identifier="$1"
    local engine="$2"
    local master_username="$3"
    local master_user_password="$4"
    local source_engine="$5"
    local source_engine_version="$6"
    local s3_bucket_name="$7"
    local s3_ingestion_role_arn="$8"
    shift 8

    cond_log_and_run aws rds restore-db-cluster-from-s3 --db-cluster-identifier $db_cluster_identifier --engine $engine --master-username $master_username --master-user-password $master_user_password --source-engine $source_engine --source-engine-version $source_engine_version --s3-bucket-name $s3_bucket_name --s3-ingestion-role-arn $s3_ingestion_role_arn "$@"
}
