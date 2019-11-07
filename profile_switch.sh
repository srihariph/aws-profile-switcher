#!/bin/bash
alias awsp='select OPT in $(sed -n "s#^\[\(.*\)\]#\1#p" ~/.aws/credentials | sort -u);
do
  # echo "You selected '$REPLY' = '$OPT'"
  export AWS_PROFILE=$OPT
  aws sts get-caller-identity
  break
done'
alias creds='subl ~/.aws/credentials'

function __ps_aws() {
  echo "(${AWS_PROFILE:-default})"
}

export PS1="\u@\h:\w \$(__ps_aws)
\$ "
