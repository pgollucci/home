aws_cfg_env_level() {

    export ENV_LEVEL=$1
}

aws_cfg_env() {
    local env="$1"

    export AWS_ENV=$env
}

aws_cfg_profile() {
    local profile="$1"

    export AWS_DEFAULT_PROFILE=$profile
    export AWS_PROFILE=$AWS_DEFAULT_PROFILE  # terraform
}

aws_cfg_region() {
    local region="$1"

    export AWS_DEFAULT_REGION=$region
}

aws_cfg_clear() {
  alias aws && unalias aws
  unset AWS_DEFAULT_PROFILE
  unset AWS_PROFILE
  unset AWS_DEFAULT_REGION
  unset AWS_ENV
  unset AWS_VPC
  unset ENV_LEVEL
}

aws_cfg_show() {

    env | grep ^AWS_
}
