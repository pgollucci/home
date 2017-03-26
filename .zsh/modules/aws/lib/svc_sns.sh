aws_sns_topic_create() {
    local sns_topic_name="$1"

    aws --output text sns create-topic --name $sns_topic_name
}

aws_sns_topic_subscribe() {
    local sns_topic="$1"
    local subs="$2"

    local sub
    for sub in $subs; do
	aws sns subscribe --topic-arn $sns_topic --protocol email --notification-endpoint $sub
    done
}
