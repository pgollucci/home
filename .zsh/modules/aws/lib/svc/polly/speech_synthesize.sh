aws_polly_speech_synthesize() {
    local output-format="$1"
    local text="$2"
    local voice-id="$3"
    shift 3

    cond_log_and_run aws polly  --output-format $output_format --text $text --voice-id $voice_id "@"

}
