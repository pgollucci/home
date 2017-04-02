aws_ec2_product_instance_confirm() {
    local instance-id="$1"
    local product-code="$2"
    shift 2

    cond_log_and_run aws ec2  --instance-id $instance_id --product-code $product_code "@"

}
