# A reasonable Emacs config

## Installation

To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`:

```sh
git clone https://github.com/jundeng86/emacs.d.git ~/Documents/.emacs.d
git git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s ~/Documents/emacs.d/.spacemacs .spacemacs
```

- Install ~eterm-256color-mode~ for fish. This package requires ~eterm-color~. If it
  doesn't exist on your system, you will be offered the option of fetching and
  compiling it from [[https://github.com/emacs-mirror/emacs][emacs-mirror]]. If
  instead you want to install manually, you can try:
  * Ubuntu
    ```sh
    
    tic $(find /usr/share/emacs -name 'eterm-color.ti')
    # or
    mkdir -p ~/.terminfo/e/
    cp $(find /usr/share/emacs -name 'eterm-color') ~/.terminfo/e/

    ```
    
