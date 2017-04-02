aws_kinesis_shard_split() {
    local shard-to-split="$1"
    local new-starting-hash-key="$2"
    local stream-name="$3"
    shift 3

    cond_log_and_run aws kinesis  --shard-to-split $shard_to_split --new-starting-hash-key $new_starting_hash_key --stream-name $stream_name "@"

}
