aws_ec2_import_image_tasks_describe() {
    shift 0

    log_and_run aws ec2 describe-import-image-tasks "$@"
}
