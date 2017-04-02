aws_mturk_file_upload_url_get() {
    local question-identifier="$1"
    local assignment-id="$2"
    shift 2

    log_and_run aws mturk  --question-identifier $question_identifier --assignment-id $assignment_id "@"

}
