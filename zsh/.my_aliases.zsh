## Aliases - my personal aliases that I use every day
#
#
### General aliases
# colored commands
if [[ -x /usr/bin/eza ]]; then alias ls='eza --binary --group --git'; else alias ls='ls --color=auto'; fi
alias grep='grep --color=auto'
alias diff='colordiff'
alias ip='ip -color=auto'
# rm interactive
alias rm='rm -i'

alias history='history 0'
# alias for lazygit
alias lg='lazygit'
# yubikey oath one-time code
alias ya='ykman oath accounts code'

# file preview with fzf and bat
alias fp='fzf --preview "bat --color=always {}"'

### kubectl aliases
#
# kubectl shortcut
k=kubectl
# kubectl change context
kcc='kubectl config use-context "$(klc | fzf -e | sed "s/^..//")"'
# kubectl change namespace
kcn='kubectl config set-context --current --namespace "$(kln | fzf -e | sed "s/^..//")"'
# kubectl list contexts
klc='kubectl config get-contexts -o name | sed "s/^/  /;\|^  $(krc)$|s/ /*/"'
# kubectl list namespaces
kln='kubectl get -o name ns | sed "s|^.*/|  |;\|^  $(krn)$|s/ /*/"'
# kubectl get current context
kgc='kubectl config current-context'
# kubectl get current namespace
kgn='kubectl config get-contexts --no-headers "$(krc)" | awk "{print \$5}" | sed "s/^$/default/"'

# This function allows for interactive deletion of Kubernetes pods
# Use the TAB key to select multiple pods for deletion
function kdelpod() {
    local selected_pods=$(kubectl get pods --all-namespaces \
        -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name | \
        tail -n +2 | \
        fzf -m --header "Use TAB to select multiple pods for deletion" \
        --border=top \
        --border-label="| Pod(s) for deletion |" | \
        awk '{print $1 " " $2}')

    if [[ -z "$selected_pods" ]]; then
        echo "No pod(s) selected for deletion."
        return 1
    fi
    echo "$selected_pods" | xargs -I {} sh -c 'kubectl delete pod $2 -n $1' _ {}
}

## Describe pods
#
function kdespod() {
    local selected_pod=$(kubectl get pods --all-namespaces \
        -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name | \
        tail -n +2 | \
        fzf -m --border=top --border-label="| Pod for description |" | \
        awk '{print $1 " " $2}')

    if [[ -z "$selected_pod" ]]; then
        echo "No pod selected for description."
        return 1
    fi
    echo "$selected_pod" | xargs -I {} sh -c 'kubectl describe pod $2 -n $1' _ {}
}
