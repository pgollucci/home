aws_clouddirectory_object_attributes_update() {
    local directory_arn="$1"
    local object_reference="$2"
    local attribute_updates="$3"
    shift 3

    cond_log_and_run aws clouddirectory update-object-attributes --directory-arn $directory_arn --object-reference $object_reference --attribute-updates $attribute_updates "$@"
}
