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
- File modification .zshrc to copy the config [from file](https://github.com/RmTrnsc/.dotfiles/blob/main/zsh/.zshrc)
  ```
  vi ~/.zsrhc
  ```
- After modifying the configuration, save the file and reload it
  ```
  source ~/.zshrc
  ```

## Custom
Install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh/wiki) to customise the shell. 
The list of plugins is [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)


### Ressources
- [Zsh installation](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

### ❗Possible language problem
- To check the current language, type
  ```
  locale
  ```
- If this gives something else `LANG=fr_FR.UTF-8`, then you need to do this.
  ```
  sudo locale-gen fr_FR && sudo locale-gen fr_FR.UTF-8
  ```
- Followed by
  ```
  sudo dpkg-reconfigure locales
  ```
- and end with
  ```
  sudo update-locale LANG="fr_FR.UTF-8" LANGUAGE="fr_FR" && export LANG=fr_FR.UTF-8
  ```
- We retype `locale` to check the change
  
