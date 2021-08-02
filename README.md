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
- **[jq](https://stedolan.github.io/jq/)**: lightweight and flexible command-line JSON processor
  ```sh
  brew install jq
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

## Other useful tools
These tools are not zsh-specific but will make your life easier, so I encourage you to install them ;)

### Kubernetes
- **[Kustomize](https://kustomize.io/)**: template-free framework to customize deployments. Although kubectl comes with kustomize, it currently [Jan 2021] is still on version 2.x (latest is 3.9.2), so installing the latest kustomize version is encouraged:
  ```sh
  brew install kustomize
  kustomize completion zsh > $(brew --prefix)/share/zsh/site-functions/_kustomize
  ```
- **[Krew](https://krew.sigs.k8s.io/docs/user-guide/quickstart/)**: kubectl plugin manager (allows you to install useful plugins)
  ```sh
  brew install krew
  # Add this line to your ~/.zshrc file
  export PATH="${PATH}:${HOME}/.krew/bin"
  ```
- **[Kubectl node-shell](https://github.com/kvaps/kubectl-node-shell)**: kubectl plugin to launch a terminal on a given node, without needing to know SSH credentials
  ```sh
  kubectl krew install node-shell
  ```
- **[Kubectl konfig](https://github.com/corneliusweig/konfig)**: kubectl plugin to import and merge kubeconfigs
  ```sh
  kubectl krew install konfig
  ```
- **[Kubectl images](https://github.com/chenjiandongx/kubectl-images)**: kubectl plugin to list all images/containers in all pods
  ```sh
  kubectl krew install images
  ```
- **[Kubectl neat diff](https://github.com/chenjiandongx/kubectl-images)**: kubectl plugin to declutter the output of `kubectl diff` (e.g. remove `managedFields`, etc.)
  ```sh
  GO111MODULE=on go get github.com/sh0rez/kubectl-neat-diff
  ```
