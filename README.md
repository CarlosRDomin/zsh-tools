## ZSH tools

This repo contains some scripts and settings to make my life easier on the terminal ;)

### Recommended requirements

A few very useful tools are:
- **[Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)**: framework for managing your Zsh configuration
  ```sh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- **[Fuzzy autocomplete](https://github.com/junegunn/fzf)**: awesome history search helper (press Ctrl+R and enjoy!)
  ```sh
  brew install fzf
  ```
- **[ZSH autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)**: suggests how to complete the current command
  ```sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  ```
- **[ZSH syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)**: highlights (colors) commands as you type to help you detect syntax errors, wrong/missing function names, etc.
  ```sh
  brew install zsh-syntax-highlighting
  ```
- **[Powerlevel10k theme](https://github.com/romkatv/powerlevel10k#powerlevel10k)**: helps you quickly see info about the repo you're in, how long a command took to run, etc.
  ```sh
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```
- **[Powerline fonts](https://github.com/powerline/fonts)**: cool fonts and icons for your theme
  ```sh
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts && ./install.sh
  cd .. && rm -rf fonts
  ```

### Installation instructions
 1. Clone this repo somewhere, e.g.
    ```sh
    git clone https://github.com/CarlosRDomin/zsh-tools.git ${HOME}/.myzsh
    ```
 2. Modify your `~/.zshrc` to include these tools, by adding this line near the top of the file:
    ```sh
    source "${HOME}/.myzsh/.zshrc"
    ```
 3. (Optional) Configure iterm2 to use the included color theme:
    `Preferences > Profiles > Colors > Color Presets... (dropdown menu) > Import...` and choose the `iterm2_theme.itermcolors` file in this repo.
 4. (Optional) for further tweaking, refer to [this gist](https://gist.github.com/kevin-smets/8568070#further-tweaking).
