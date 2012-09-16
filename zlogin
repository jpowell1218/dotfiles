# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "%{$fg_bold[grey]%}${ref#refs/heads/}%{$reset_color%} "
  fi
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# prompt
# export PS1='$(git_prompt_info) [${SSH_CONNECTION+"%{$fg_bold[red]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] > '
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~ $(git_prompt_info)%{$fg_bold[red]%}-%{$fg_bold[yellow]%}+%{$fg_bold[green]%}> %{$reset_color%}'

# Apex Lexis Nexis Server Addresses
alias apex_dev='ssh -i $HOME/.ec2/apex.pem ubuntu@ec2-50-18-52-128.us-west-1.compute.amazonaws.com'
alias apex_qa='ssh -i $HOME/.ec2/apex.pem ubuntu@ec2-50-18-35-254.us-west-1.compute.amazonaws.com'
alias apex_production_util='ssh -i $HOME/.ec2/apexproduction.pem ubuntu@ec2-184-72-58-101.us-west-1.compute.amazonaws.com'
alias cert1="ssh -v -i apex.pem ubuntu@ec2-50-18-52-185.us-west-1.compute.amazonaws.com"
alias cert2="ssh -v -i apex.pem ubuntu@ec2-50-18-55-31.us-west-1.compute.amazonaws.com"
