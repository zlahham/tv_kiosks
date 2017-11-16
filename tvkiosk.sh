#!/bin/bash

set -e # Exit on errors

if [ -n "$TMUX"  ]; then
    export NESTED_TMUX=1
      export TMUX=''
    fi

    if [ ! $TV_DIR  ]; then export TV_DIR=$HOME/workspace/msc_projects/tv_kiosks; fi

    cd $TV_DIR

    tmux new-session  -d -s TV-Kiosks
    tmux set-environment -t TV-Kiosks -g TV_DIR $TV_DIR

    tmux new-window     -t TV-Kiosks -n 'Web'
    tmux send-key       -t TV-Kiosks 'cd $TV_DIR'      Enter 'rails s'                                           Enter

    tmux new-window     -t TV-Kiosks -n 'Console'
    tmux send-key       -t TV-Kiosks 'cd $TV_DIR'      Enter 'rails c'                                           Enter

    # tmux new-window     -t TV-Kiosks -n 'Guard'
    # tmux send-key       -t TV-Kiosks 'cd $TV_DIR'      Enter 'bundle exec guard'                                 Enter

    tmux new-window     -t TV-Kiosks -n 'vim'
    tmux send-key       -t TV-Kiosks 'cd $TV_DIR'      Enter 'vim .'                                             Enter

    if [ -z "$NESTED_TMUX"  ]; then
        tmux -2 attach-session -t TV-Kiosks
      else
          tmux -2 switch-client -t TV-Kiosks
        fi
    fi
fi
