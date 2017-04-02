aws_polly_lexicon_get() {
    local name="$1"
    shift 1

    log_and_run aws polly  --name $name "@"

}
