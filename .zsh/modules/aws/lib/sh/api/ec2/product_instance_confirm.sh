aws_ec2_product_instance_confirm() {
    local instance_id="$1"
    local product_code="$2"
    shift 2

    cond_log_and_run aws ec2 confirm-product-instance --instance-id $instance_id --product-code $product_code "$@"
}
