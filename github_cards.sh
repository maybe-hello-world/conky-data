#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: ./github-query.sh STATUS"
    exit 1
fi

STATUS=$1

curl --url 'https://api.github.com/graphql' --header "Authorization: bearer $GITHUB_PROJECT_TOKEN" --request POST --data "{\"query\":\"{node(id: \\\"$GITHUB_PROJECT_ID\\\") {... on ProjectV2 {items(first: 100) {nodes {fieldValues(first: 100) {nodes {... on ProjectV2ItemFieldSingleSelectValue {name}}}content {... on DraftIssue { title } ... on Issue { title } ... on PullRequest {title}}}}}}}\"}" | jq -r --arg STATUS "$STATUS" '.data.node.items.nodes[] | select(.fieldValues.nodes[1].name == $STATUS) | .content.title'
