aws_rekognition_faces_by_image_search() {
    local collection_id="$1"
    local image="$2"
    shift 2

    cond_log_and_run aws rekognition search-faces-by-image --collection-id $collection_id --image $image "$@"
}
