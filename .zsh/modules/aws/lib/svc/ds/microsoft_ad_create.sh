aws_ds_microsoft_ad_create() {
    local vpc-settings="$1"
    local password="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws ds  --vpc-settings $vpc_settings --password $password --name $name "@"

}
