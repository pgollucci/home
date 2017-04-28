aws_mturk_file_upload_url_get() {
    local assignment_id="$1"
    local question_identifier="$2"
    shift 2

    log_and_run aws mturk get-file-upload-url --assignment-id $assignment_id --question-identifier $question_identifier "$@"
}
