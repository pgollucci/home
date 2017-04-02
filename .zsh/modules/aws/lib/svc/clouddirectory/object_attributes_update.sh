aws_clouddirectory_object_attributes_update() {
    local directory-arn="$1"
    local attribute-updates="$2"
    local object-reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --attribute-updates $attribute_updates --object-reference $object_reference "@"

}
