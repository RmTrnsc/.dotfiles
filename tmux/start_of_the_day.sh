#!/bin/bash

EZIO_PATH="/mnt/d/web/ezio"
AGENDA_PATH="/mnt/d/web/agenda"
DATE=$(date +"%A")
HOUR=$(date +"%H")
EZIO_MYSQL="/mnt/d/backup/ezio/"$DATE
AGENDA_MYSQL="/mnt/d/backup/planning/"$DATE

launch_services(){
	sudo service mysql start
	sudo service apache2 start
	sudo -k
}

launch_tmux() {
	# create new session
	ts

	# restore session
	tmux run-shell			~/.config/tmux/plugins/tmux-resurrect/scritps/restore.sh

	# launch assets
	tmux select-window		-t dev:assets
	tmux send-keys			'php bin/console c:c' C-m
	tmux send-keys			'php bin/console a:i' C-m
	tmux send-keys			'php bin/console a:w' C-m

	# launche server
	tmux select-window		-t dev:server
	tmux select-pane		-t 0
	tmux send-keys			'php bin/console s:r' C-m
	tmux select-pane		-t 1
	tmux send-keys			'php bin/console s:r' C-m

	# launch mysql
	tmux select-window		-t dev:mysql
	tmux select-pane		-t 2
#	tmux send-keys			'/usr/bin/backup_bdd.sh' Enter

	sleep "20"

	tmux select-pane		-t 0
	tmux send-keys			'cd '$EZIO_MYSQL C-m
	tmux send-keys			'pv '$HOUR'h.sql | sudo mysql -u neoadmin -p -h localhost ezio' C-m
	
	sudo -k

	tmux select-pane		-t 1
	tmux send-keys			'cd '$AGENDA_MYSQL C-m
	tmux send-keys			'pv '$HOUR'h.sql | sudo mysql -u neoadmin -p -h localhost agenda' C-m

	# attach session
	tmux select-window		-t dev:mysql
	tmux select-pane		-t 0

	tmux attach-session		-t dev
}

launch_services
launch_tmux
