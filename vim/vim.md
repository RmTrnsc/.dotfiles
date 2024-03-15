# Vim configuration
- If is not installed
  ```
  sudo apt update && sudo apt install vim
  ```
- Type this for create all folder and config file
  ```
  mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged && touch ~/.vimrc
  ```
- Launch this command
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
- Start vim
  ```
  vim ~/.vimrc
  ```
- Copy [this content file](https://github.com/RmTrnsc/.dotfiles/blob/main/vim/.vimrc)
- Install all plugin
  ```
  :PlugInstall
  ```
- Reload configuration
  ```
  :source ~/.vimrc
  ```
  Enjoy !
