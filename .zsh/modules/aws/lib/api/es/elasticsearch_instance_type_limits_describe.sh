aws_es_elasticsearch_instance_type_limits_describe() {
    local instance_type="$1"
    local elasticsearch_version="$2"
    shift 2

    log_and_run aws es describe-elasticsearch-instance-type-limits --instance-type $instance_type --elasticsearch-version $elasticsearch_version "$@"
}
