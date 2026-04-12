#############################################################
# Script to list users of a GitHub repository
# author: @sairam
# date  : 06/10/2024
# Usage: ./list_repository_collaborators.sh <owner> <repo>
# befor using the script give the username and token in the cmd
    # export username="your_github_username"
    # export token="your_github_token"
############################################################################
api="https://api.github.com"
USERNAME=$username
TOKEN=$token

owner=$1
repo=$2

function github_api_get{
    local api_url="$1"
    local full_url="${api}/${api_url}"
    curl -s -u "${USERNAME}:${TOKEN}" "$full_url"
}

function list_collaborators{
    local api_url="/repos/$owner/$repo/collaborators"
    collaborators=collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"
    if [ -z "$collaborators" ]; then
        echo "No collaborators found for the repository $owner/$repo."
        exit 0
    else
        echo "$collaborators" 
    fi
}

