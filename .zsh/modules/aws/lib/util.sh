aws_util_account_id_to_alias() {
    local account_id="$1"
    local map="$2"

    json_key_2_value "$account_id" "$map"
}

aws_util_account_alias_to_id() {
    local account_alias="$1"
    local map="$2"

    json_value_2_key "${account_alias}" "$map"
}

aws_util_account_map() {
    local account_id="$1"
    local account_alias="$2"
    local map="$3"

    sed -i -e '$d' $map
    sed -i -e '$s/$/,/' $map
    echo " \"$account_id\": \"$account_alias\"" >> $map
    echo "}" >> $map
}

aws_util_nicks() {
    local org="$1"
    local map="$2"

    local type="aws"

    awk -v k=$1 '$2 ~ k { print $2 }' < $map | sed -e 's,["],,g' | xargs | sed -e 's, ,,g' -e "s,$org,${type}-${org},g"
}

aws_util_region_for_profile_from_cred_file() {
    local profile="$1"
    local cred_file="$2"

    grep -A 5 $profile $cred_file | awk '/region/ { print $3 }'
}
