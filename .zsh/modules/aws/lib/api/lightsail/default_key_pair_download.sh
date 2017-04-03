aws_lightsail_default_key_pair_download() {
    shift 0

    cond_log_and_run aws lightsail download-default-key-pair "$@"
}
