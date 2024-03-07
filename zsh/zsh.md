# Zsh configuration
## Command lines
- Installing zsh  
  ⚠️ **Don't accept the default configuration when it is proposed, then import my configuration**
  ```
  sudo apt update && sudo apt install zsh
  ```
- Set zsh as default shell
  ```
  chsh -s $(which zsh)
  ```
- Type `zsh` in the terminal to switch to the new shell
- After modifying the configuration, save the file and reload it
  ```
  source ~/.zshrc
  ```

## Custom
Install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh/wiki) to customise the shell. 
The list of plugins is [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)


### Ressources
- [Zsh installation](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
