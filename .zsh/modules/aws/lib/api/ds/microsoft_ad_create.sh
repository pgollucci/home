aws_ds_microsoft_ad_create() {
    local name="$1"
    local password="$2"
    local vpc_settings="$3"
    shift 3

    cond_log_and_run aws ds create-microsoft-ad --name $name --password $password --vpc-settings $vpc_settings "$@"
}
