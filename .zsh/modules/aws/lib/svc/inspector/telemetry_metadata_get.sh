aws_inspector_telemetry_metadata_get() {
    local assessment-run-arn="$1"
    shift 1

    log_and_run aws inspector  --assessment-run-arn $assessment_run_arn "@"

}
