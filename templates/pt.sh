#!/bin/bash -xe

# allow to run multiple instances in the same time in /tmp
uuid=$(uuidgen)
mkdir /tmp/$uuid
export GEM_HOME=/tmp/$uuid

rm -f Gemfile.lock
gem install bundler --no-rdoc --no-ri --verbose
gem install r10k --no-rdoc --no-ri --verbose

test=${1:-rake}
pattern=${2:-'classes,defines,unit,functions,hosts,integration,types'}
if [ ! -z "$3" ]; then
    export PUPPET_GEM_VERSION="~> $1.0"
fi
default_pattern="spec/\{${pattern}\}/\*\*/\*_spec.rb"

bundle install

case $test in
   rake)
     bundle exec rake spec "SPEC_OPTS=--format documentation --pattern ${default_pattern}" --trace
     ;;
   lint)
     bundle exec puppet-lint .
     ;;
   rake-lint)
     bundle exec rake lint --trace
     ;;
   *)
     bundle exec puppet-lint .
     ;;
esac

rm -rf /tmp/$uuid
