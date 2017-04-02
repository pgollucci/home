aws_es_elasticsearch_instance_type_limits_describe() {
    local elasticsearch-version="$1"
    local instance-type="$2"
    shift 2

    log_and_run aws es  --elasticsearch-version $elasticsearch_version --instance-type $instance_type "@"

}
