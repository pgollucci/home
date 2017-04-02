aws_polly_lexicon_put() {
    local name="$1"
    local content="$2"
    shift 2

    cond_log_and_run aws polly  --name $name --content $content "@"

}
