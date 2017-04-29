aws_ec2_fpga_image_create() {
    local input_storage_location="$1"
    shift 1

    cond_log_and_run aws ec2 create-fpga-image --input-storage-location $input_storage_location "$@"
}
