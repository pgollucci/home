aws_codepipeline_custom_action_type_create() {
    local category="$1"
    local input-artifact-details="$2"
    local action-version="$3"
    local output-artifact-details="$4"
    local provider="$5"
    shift 5

    cond_log_and_run aws codepipeline  --category $category --input-artifact-details $input_artifact_details --action-version $action_version --output-artifact-details $output_artifact_details --provider $provider "@"

}
