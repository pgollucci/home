aws_rds_db_log_file_portion_download() {
    local db_instance_identifier="$1"
    local log_file_name="$2"
    shift 2

    cond_log_and_run aws rds download-db-log-file-portion --db-instance-identifier $db_instance_identifier --log-file-name $log_file_name "$@"
}
