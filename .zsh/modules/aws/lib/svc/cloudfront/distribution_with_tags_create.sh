aws_cloudfront_distribution_with_tags_create() {
    local distribution-config-with-tags="$1"
    shift 1

    cond_log_and_run aws cloudfront  --distribution-config-with-tags $distribution_config_with_tags "@"

}
