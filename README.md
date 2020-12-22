## TODOS

### AFTER INSTALLING A LINUX DISTRO.

<hr>

-  **Get curl, zsh, vim, git, cmus, cmatrix, neofetch, vlc, pip, tree**
    ```shell
    sudo apt install curl zsh vim git cmus cmatrix neofetch vlc python3-pip tree
    ```

    Get configured zsh shell.

    ```shell
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

<br>

-  **nodejs, atom or another text editor, youtube-dl**
    > For [nodejs](https://github.com/nodesource/distributions)

    > For [atom](https://atom.io/)

   _For youtube-dl_
    ```shell
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
    ```
    Audio from youtube can downloaded with command yt <link>, alias set in `.zshrc`. You need to source it after downloading youtube-dl though.

<br>

- **Copy .zshrc**
> Check the aliases, if they're configured. Source .zshrc after configuring it.

<br>

- **For .vimrc**

    _Download [vim plug](https://github.com/junegunn/vim-plug) for required plugins._
    ```shell
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

    Then, run `:PlugInstall` and restart vim.

<br>

- **pyenv**

    If needed, get from [here](https://github.com/pyenv/pyenv).
    The echo commands are used to write in `.zshrc`, which is already in the given `.zshrc` file above.
    ```shell
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

    exec "$SHELL"
    ```
<br>

- [**Fixing npm permissions**](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally/)

    If you see an EACCES error when you try to install a package globally, you can either:

    ```
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    ```

    Add this line to `.zshrc`, though should be already in that above file.

    ```
    export PATH=~/.npm-global/bin:$PATH
    ```

<hr>

# FOR ARCH

Default terminal set to terminator in i3 config.
```
sudo pacman -S terminator
```

## To get wifi up in arch

- Install basedevel, networkmanager
```
sudo pacman -S base-devel networkmanager
```

- Install yay
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

- Install broadcom drivers
```
yay broadcom-wl-dkms
cd broadcom-wl-dkms
makepkg -si
```

Then, yay and broadcom drivers will be installed in the system.

<hr>

- While installing networkmanager, nmcli will be installed as well.
```
nmcli device wifi list
nmcli device wifi connect 'SSID' password 'password'
```

The wifi should now be connected.

```
sudo ls /etc/NetworkManager/system-connections/
```
On running this command, you should get this output:

`'SSID.nmconnection'`

After this, wifi will be connected to the system and will remain connected on reboot.

## AUDIO

I use alsamixer is used for audio.

```
sudo pacman -S alsa-utils alsa-lib
```
Then, open alsamixer
```
alsamixer
```
Adjust the volume there. Then sound should work.


## POLYBAR
I got this polybar theme from [here](https://github.com/adi1090x/polybar-themes) and customized it a bit for my system.

To use this properly, we need fonts installed. This can be done by running this command:

```
# navigate to the folder
cd .config/polybar

# install fonts
cp -r fonts/* ~/.local/share/fonts

# reload font cache
fc-cache -v

# remove if it exists
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf

# launch the polybar
~/.config/polybar/launch.sh
```

The script to launch it is in the i3 config file as well.

## VIM and ZSH

To install them,

```
sudo pacman -S vim zsh
```

For configurations, same as mentioned above, for debian/ubuntu system.
