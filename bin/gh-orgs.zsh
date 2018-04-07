#!/usr/bin/env zsh -li

main() {

    local gh=https://github.com
    local gh_api=https://api.github.com
    local orgs_dir=$P6_SRC_GH_DIR

    local orgs=" \
airbrb \
angular \
ansible \
apache \
apple \
aws \
awslabs \
azure \
boot2docker \
boto \
cisco \
cloudera \
cloudfare \
cloudoundry \
coreos \
d3 \
deepmind \
digitalocean \
docker \
dropbox \
eclipse \
etsy \
facebook \
freebsd \
git \
github \
gitlabhq \
go \
google \
googlecloudplatform \
graphql \
h2o \
hashicorp \
heroku \
homebrew \
instagram \
jenkinsci \
joyent \
jquery \
kotlin \
kubernetes \
linkedin \
lyft \
microsoft \
mozilla \
nasa \
netflix \
nginx \
nodejs \
nomad \
nvidia \
openssl \
p6m7g8 \
paypal \
php \
prometheus \
puppet \
python \
rabbitmq \
rails \
rbenv \
reactivex \
reactjs \
reddit \
resque \
slackhq \
spotify \
square \
stripe \
tecent \
tensorflow \
thoughtbot \
travis-ci \
twitter \
uber \
vim \
vmware \
yahoo \
zeromq \
"
    local org
    for org in $(echo $orgs); do
	gh_clone_org_repos "$gh" "$gh_api" "$org" "$orgs_dir" "" "2"
    done
}

main "$@"
