aws_ec2_product_instance_confirm() {
    local product_code="$1"
    local instance_id="$2"
    shift 2

    cond_log_and_run aws ec2 confirm-product-instance --product-code $product_code --instance-id $instance_id "$@"
}
