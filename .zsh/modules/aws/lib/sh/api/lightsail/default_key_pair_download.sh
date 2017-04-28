aws_lightsail_default_key_pair_download() {

    cond_log_and_run aws lightsail download-default-key-pair "$@"
}
