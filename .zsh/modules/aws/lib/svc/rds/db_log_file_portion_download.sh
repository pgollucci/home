aws_rds_db_log_file_portion_download() {
    local log-file-name="$1"
    local db-instance-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --log-file-name $log_file_name --db-instance-identifier $db_instance_identifier "@"

}
