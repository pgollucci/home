aws_kinesis_shard_split() {
    local stream_name="$1"
    local shard_to_split="$2"
    local new_starting_hash_key="$3"
    shift 3

    cond_log_and_run aws kinesis split-shard --stream-name $stream_name --shard-to-split $shard_to_split --new-starting-hash-key $new_starting_hash_key "$@"
}
