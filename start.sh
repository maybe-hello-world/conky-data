#!/bin/bash

DIR=~/.conky/


launch() {
    RUN=`ps aux | grep conky | grep $1`
    source $DIR.env

    if [ -z "$RUN" ]; then
        conky -c $DIR$1 --pause=3 -q &
    fi
}

launch "systemrc"
launch "networkrc"
launch "calrc"
launch "weatherrc"
launch "trello_headerrc"
launch "trello_hotrc"
launch "trello_nowrc"
launch "trello_inprogressrc"
launch "github_headerrc"
launch "github_coldrc"
launch "github_hotrc"
launch "github_inprogressrc"
