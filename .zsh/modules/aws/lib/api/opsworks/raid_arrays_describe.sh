aws_opsworks_raid_arrays_describe() {
    shift 0

    log_and_run aws opsworks describe-raid-arrays "$@"
}
