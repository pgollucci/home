aws_polly_lexicon_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws polly delete-lexicon --name $name "$@"
}
