#!/bin/bash
# Type this command to create a symlink
# sudo ln -s path/of/file /usr/local/bin/name_of_script

EZIO_PATH="/mnt/d/web/ezio"
AGENDA_PATH="/mnt/d/web/agenda"
DATE=$(date +"%A")
HOUR=$(date +"%H")
EZIO_MYSQL="/mnt/d/backup/ezio/"$DATE
AGENDA_MYSQL="/mnt/d/backup/planning/"$DATE

launch_services(){
	sudo service mysql start
	sudo service apache2 start
}

launch_tmux() {
	# create new session
	tmux new-session		-d -s dev

	# create windows
	tmux rename-window		-t dev:1 assets

	tmux new-window         	-t dev:2
	tmux rename-window		-t dev:2 server
	tmux split-window		-h -p 50
	
	tmux new-window         	-t dev:3
	tmux rename-window		-t dev:3 git/composer/debug
	tmux split-window		-h -p 50
	
	tmux new-window         	-t dev:4
	tmux rename-window		-t dev:4 mysql
	tmux split-window		-v -p 50
 	tmux select-pane		-t 1
	tmux split-window		-h -p 50

	tmux new-window         	-t dev:5
	tmux rename-window		-t dev:5 zsh


	# launch assets
	tmux select-window		-t dev:assets

    	tmux send-keys          	'cd '$EZIO_PATH C-m
	tmux send-keys			'php bin/console c:c' C-m
	tmux send-keys			'php bin/console a:i' C-m
	tmux send-keys			'php bin/console a:w' C-m

	# launche server
	tmux select-window		-t dev:server

	tmux select-pane		-t 1
	tmux send-keys			'cd '$EZIO_PATH' && php bin/console s:r' C-m

    sleep "5"

	tmux select-pane		-t 2
	tmux send-keys			'cd '$AGENDA_PATH' && php bin/console s:r' C-m

	# launch git
	tmux select-window		-t dev:git/composer/debug

	tmux select-pane		-t 1
	tmux send-keys			'cd '$EZIO_PATH C-m
	
	tmux select-pane		-t 2
	tmux send-keys			'cd '$AGENDA_PATH C-m

	# launch mysql
	tmux select-window		-t dev:mysql

	tmux select-pane		-t 3
	tmux send-keys			'/usr/bin/backup_bdd.sh' Enter

	sleep "20"

	tmux select-pane		-t 1
	tmux send-keys			'cd '$EZIO_MYSQL C-m
	tmux send-keys			'pv '$HOUR'h.sql | sudo mysql -u neoadmin -p -h localhost ezio' C-m

	tmux select-pane		-t 2
	tmux send-keys			'cd '$AGENDA_MYSQL C-m
	tmux send-keys			'pv '$HOUR'h.sql | sudo mysql -u neoadmin -p -h localhost agenda' C-m


	# enf of launch 
	tmux select-window		-t dev:4
	tmux select-pane		-t 1

	# attach session
	tmux attach-session		-t dev
}

launch_services
launch_tmux
