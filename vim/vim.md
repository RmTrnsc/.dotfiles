# Vim configuration
- If is not installed
  ```
  sudo apt update && sudo apt install vim
  ```
- Imported all vim files and folder [this file](https://github.com/RmTrnsc/.dotfiles/blob/main/vim/vimrc) and [this folder](https://github.com/RmTrnsc/.dotfiles/blob/main/vim/vim) at the root  
  ⚠️ Don't forget to rename the `vimrc` file to `.vimrc`.
- Launch this command
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
- Start vim
  ```
  vim ~/.vimrc
  ```
- Install all plugin
  ```
  :PlugInstall
  ```
- Reload configuration
  ```
  :source ~/.vimrc
  ```
  Enjoy !
