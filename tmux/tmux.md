# Tmux configuration
## Command lines
- If is not installed
   ```
  sudo apt update && sudo apt install tmux
  ```
- Started a tmux session
    - Without _zsh_  
      ```
      tmux
      ```
      or
      ```
      tmux new-session
      ```
      or if you want to attach a session
      ```
      tmux new -s _sessionname_ && tmux a _sessionname_
      ```
    - With _zsh_
      ```
      ts
      ```
- For the first launch, and after each plugin addition
  - Install the plugins  
    ➡️ `Ctrl-b` + `I`
  - Or update  
    ➡️ `Ctrl-b` + `U`
- After making changes to each file, reload the configuration
  - In tmux  
    ➡️ `Ctrl-b` + `:` _(open the command prompt)_ and type this ➡️ `source ~/.tmux.conf` or with the binding command `Ctrl-b` + `r`
  - Outside tmux  
    ```
    tmux source ~/.tmux.conf
    ```
- Detach session  
  ➡️ `Ctrl-b` + `d`
- To list sessions
  - Wihtout zsh
    ```
    tmux ls
    ```
  - With zsh
    ```
    tl
    ```
- Kill pane  
  ➡️ `Ctrl-b` + `x` and type `y` for yes  
- Kill session
  - Without _zsh_  
    ```
    tmux kill-session -t _sessionname_
    ```
  - With _zsh_  
    ```
    tkss
    ```
- Kill tmux server
  - Without _zsh_  
    ```
    tmux kill-server
    ```
  - With _zsh_  
    ```
    tksv
    ```

### Other command lines
- Instead of recreating everything by hand, I can add the resurrection [script](https://github.com/RmTrnsc/.dotfiles/blob/main/tmux/restore.sh) to the resurrect plugin config and run this command
  ⚠️ Be careful after downloading this [script](https://github.com/RmTrnsc/.dotfiles/blob/main/tmux/start_of_the_day.sh)
  ```
  sudo /usr/bin/start_of_the_day.sh
  ```

### Ressources
- [Tmux wiki](https://github.com/tmux/tmux/wiki)
- [Plugins list](https://github.com/tmux-plugins/list)
- [The basis of my tmux](https://github.com/olimorris/dotfiles/tree/main/.config/tmux) _thanks [olimorris](https://github.com/olimorris)_
