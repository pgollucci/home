__setup() {

    export JC_EMAIL=pgollucci@p6m7g8.com

    path_if "${___dir}/bin"
}

jc_app_create() {
    local account_id="$1"
    local bits="$2"
    local days="$3"
    local subject="$4"
    local org="$5"
    local role_path="$6"
    local provider="$7"
    local login="$8"
    local dir="$9"

    openssl genrsa -out $dir/${account_id}.key $bits 2>/dev/null
    openssl req -new -x509 -key $dir/${account_id}.key -out $dir/${account_id}.crt -days $days -subj $subject 2>/dev/null

    jc_app.py --key $dir/${account_id}.key --crt $dir/${account_id}.crt --org ${org} --account_id ${account_id} --role_path ${role_path} --provider $provider --login $login

    mv ~/Downloads/${provider}-aws-metadata.xml $dir/${account_id}-aws-${provider}.xml

    echo $dir/${account_id}-aws-${provider}.xml
}

__setup
