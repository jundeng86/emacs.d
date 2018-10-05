
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spvisual studio code  acemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy instaDroid Sans Monollation of layers (i.e. layers are installed only when a file
   ;; with a supported Droid Sans Monotype is opened). Possible values are `all', `utern binary not foundnused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-cVPN I've already asked the IT guy, I just sent a mail again. He might call you tomorrow morning...onfigurahttps://github.com/jundengdeng/emacs.d.gittion-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     pdf-tools
     csv
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion
      :variables
      auto-completion-return-key-behavior        'complete
      auto-completion-tab-key-behavior           'cycle
      auto-completion-complete-with-key-sequence nil
      auto-completion-private-snippets-directory nil
      auto-completion-enable-help-tooltip        t
      auto-completion-enable-snippets-in-popup   t
      auto-completion-enable-sort-by-usage       t
      )
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell
            )
     spell-checking
     syntax-checking
     version-control
     (python :variables
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t
             python-fill-column 80
             )
     (latex :variables
            latex-build-command "LatexMk"
            )
     bibtex
     (ranger :variables
             ranger-show-preview t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      highlight-indent-guides
                                      monokai-theme
                                      whole-line-or-region
                                      move-dup
                                      highlight-symbol
                                      beacon
                                      diredfl
                                      eterm-256color
                                      yasnippet-snippets
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    org-projectile
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.8)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Bitstream Vera Sans Mono-11"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

 ;; (setq configuration-layer--elpa-archives
 ;;       '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
 ;;         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
 ;;         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; highlight indent

  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\|)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

  ;; add a header

  (beacon-mode t)

 ;; (use-package dired-narrow
 ;;   :ensure t
 ;;   :bind (:map dired-mode-map
 ;;               ("/" . dired-narrow)))
  ;; colorful dired
  (diredfl-global-mode t)

  (setq dired-listing-switches "-alk")

  (setq directory-free-space-args "-Pm")
  (defadvice insert-directory (after insert-directory-adjust-total-by-1024 activate)
    "modify the total number by dividing it by 1024"
    (save-excursion
      (save-match-data
        (goto-char (point-min))
        (when (re-search-forward "^ *total used in directory \\([0-9]+\\) ")
          (replace-match (number-to-string (/ (string-to-number (match-string 1)) 1024)) nil nil nil 1)))))

  (global-set-key (kbd "s-z") 'undo)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'term-mode-hook 'toggle-truncate-lines)
  ;; add eterm-256color, follow the site to be prepared: https://github.com/dieggsy/eterm-256color

  (use-package eterm-256color
    :ensure t)
  (add-hook 'term-mode-hook #'eterm-256color-mode)

  ;; disable linum-mode when using pdf-tool
  (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

  (exec-path-from-shell-copy-env "PYTHONPATH")
  (setq python-shell-virtualenv-root "/home/jd/anaconda3/")
  (setq python-shell-interpreter "/home/jd/anaconda3/bin/ipython")

  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))

  (use-package org
    :bind (:map spacemacs-org-mode-map-root-map ("M-RET" . nil)))

(use-package org-table
  :defer t
  :config
  (progn
;;;; Table Field Marking
    (defun org-table-mark-field ()
      "Mark the current table field."
      (interactive)
      ;; Do not try to jump to the beginning of field if the point is already there
      (when (not (looking-back "|[[:blank:]]?"))
        (org-table-beginning-of-field 1))
      (set-mark-command nil)
      (org-table-end-of-field 1))

    (defhydra hydra-org-table-mark-field
      (:body-pre (org-table-mark-field)
       :color red
       :hint nil)
      "
   ^^      ^🠙^     ^^
   ^^      _p_     ^^
🠘 _b_  selection  _f_ 🠚          | Org table mark ▯field▮ |
   ^^      _n_     ^^
   ^^      ^🠛^     ^^
"
      ("x" exchange-point-and-mark "exchange point/mark")
      ("f" (lambda (arg)
             (interactive "p")
             (when (eq 1 arg)
               (setq arg 2))
             (org-table-end-of-field arg)))
      ("b" (lambda (arg)
             (interactive "p")
             (when (eq 1 arg)
               (setq arg 2))
             (org-table-beginning-of-field arg)))
      ("n" next-line)
      ("p" previous-line)
      ("q" nil "cancel" :color blue))

    (bind-keys
     :map org-mode-map
     :filter (org-at-table-p)
     ("S-SPC" . hydra-org-table-mark-field/body))))

  (use-package whole-line-or-region
    :init
    (whole-line-or-region-mode t)
    (diminish 'whole-line-or-region-mode)
    (make-variable-buffer-local 'whole-line-or-region-mode)
    )

  (defun kill-to-end () "Kills text from the cursor postion to the end of the buffer. This command adds the killed text to the kill-ring" (interactive) (save-excursion (let ((beg (point)) (end (point-max))) (kill-region beg end))))
  ;; keybinding
  (global-set-key (kbd "s-k") 'kill-to-end);;super+k to kill the rest from the cursor point
  (use-package move-dup
    :init
    (global-set-key [M-up] 'md/move-lines-up)
    (global-set-key [M-down] 'md/move-lines-dow)
    (global-set-key [M-S-up] 'md/move-lines-up)
    (global-set-key [M-S-down] 'md/move-lines-down)
    (global-set-key (kbd "C-c p") 'md/duplicate-down)
    (global-set-key (kbd "C-c P") 'md/duplicate-up)
    )

  (use-package highlight-symbol
    :init
    (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
    (add-hook 'text-mode-hook 'highlight-symbol-nav-mode)
    (global-set-key (kbd "M-'") 'highlight-symbol-query-replace))

  (defun refresh-file ()
    "Refresh the buffer from the disk."
    (interactive)
    (revert-buffer t t)
    )

  (global-set-key [f5] 'refresh-file)


  (defun org-meta-return* (&optional ignore)
    "context respecting org-insert"
    (interactive "P")
    (if ignore
        (org-return-indent)
      (cond
       ;; checkbox
       ((org-at-item-checkbox-p) (org-insert-todo-heading nil))
       ;; item
       ((org-at-item-p) (org-insert-item))
       ;; todo element
       ((org-element-property :todo-keyword (org-element-context))
        (org-insert-todo-heading 4))
       ;; heading
       ((org-at-heading-p) (org-insert-heading-respect-content))
       ;; plain text item
       ((string-or-null-p (org-context))
        (progn
          (let ((org-list-use-circular-motion t))
            (org-beginning-of-item)
            (end-of-line)
            (org-meta-return*))))
       ;; fall-through case
       (t (org-return-indent)))))

  (eval-after-load "reftex"
    '(progn
       (define-key reftex-mode-map (kbd "C-c c")
         (lambda ()
           (interactive)
           (let ((reftex-refstyle "\\Cref"))
             (reftex-reference " "))))))

  (setq reftex-enable-partial-scans t)
  ;; Enable bibtex to generate the custimized key
  ;; nameYY-ABC
  (setq bibtex-align-at-equal-sign t
        bibtex-autokey-name-case-convert-function (quote capitalize)
        bibtex-autokey-name-year-separator ""
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-year-length 2
        bibtex-autokey-titlewords-stretch 2
        bibtex-autokey-titlewords 3
        bibtex-autokey-titleword-ignore '("")
        bibtex-autokey-titleword-case-convert-function (quote capitalize)
        bibtex-autokey-titleword-separator ""
        bibtex-autokey-titleword-length 1
        )
  ;; flyspell switch dictionary between british and american
  (defun fd-switch-dictionary()
    (interactive)
    (let* ((dic ispell-current-dictionary)
           (change (if (string= dic "american") "british" "american")))
      (ispell-change-dictionary change)
      (message "Dictionary switched from %s to %s" dic change)
      ))

  (global-set-key (kbd "<f8>")   'fd-switch-dictionary)
  
  ;;----------------------------------------------------------------------------
  ;; When splitting window, show (other-buffer) in the new window
  ;;----------------------------------------------------------------------------
  (eval-when-compile (require 'cl))
  (defun split-window-func-with-other-buffer (split-function)
    (lexical-let ((s-f split-function))
      (lambda ()
        (interactive)
        (funcall s-f)
        (set-window-buffer (next-window) (other-buffer)))))

  (global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer 'split-window-vertically))
  (global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer 'split-window-horizontally))

  ;;(setq term-default-bg-color "#211E1E")
  ;;(setq term-default-fg-color "#FFFFF")

  (setq yas-snippet-dirs
        '(;;"~/.emacs.d/snippets"                 ;; personal snippets
        ;;  "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
          "/home/jd/.emacs.d/elpa/yasnippet-snippets-20180922.1928/snippets" ;; yasnippet-snippets
          ))
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "53f97243218e8be82ba035ae34c024fd2d2e4de29dc6923e026d5580c77ff702" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#3C3D37" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (python-docstring yasnippet-snippets company-quickhelp spinner treepy graphql undo-tree auctex eterm-256color gruvbox-theme key-chord tablist alert log4e gntp markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode request parsebib gitignore-mode fringe-helper git-gutter+ git-gutter pos-tip flycheck pkg-info epl flx magit magit-popup git-commit ghub with-editor smartparens iedit anzu evil goto-chg highlight dash-functional tern company bind-map bind-key biblio biblio-core yasnippet packed anaconda-mode pythonic helm avy helm-core async auto-complete popup f s dash highlight-indent-guides dracula-theme jedi jedi-core python-environment epc ctable concurrent deferred dired-hacks-utils swiper-helm dired-rainbow diredfl dired-narrow beacon seq ranger powerline pdf-tools ivy org-plus-contrib multiple-cursors insert-shebang hydra projectile helm-bibtex flyspell-correct fish-mode company-shell yapfify xterm-color ws-butler winum whole-line-or-region which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox origami orgit org-ref org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text move-dup monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide hy-mode hungry-delete htmlize hl-todo highlight-symbol highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diminish diff-hl define-word cython-mode csv-mode company-tern company-statistics company-auctex company-anaconda column-enforce-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822" :family "Bitstream Vera Sans Mono" :foundry "Bits" :slant normal :weight normal :height 96 :width normal)) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C" :family "Bitstream Vera Sans Mono" :foundry "Bits" :slant normal :weight normal :height 96 :width normal))))
 '(helm-source-header ((t (:background "black" :foreground "tomato")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "53f97243218e8be82ba035ae34c024fd2d2e4de29dc6923e026d5580c77ff702" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#3C3D37" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets symon string-inflection spaceline-all-the-icons prettier-js pippel pipenv password-generator spinner overseer org-brain nameless magit-svn json-navigator hierarchy importmagic helm-xref helm-purpose window-purpose imenu-list helm-git-grep gitignore-templates flycheck-bashate evil-org treepy graphql evil-lion evil-goggles evil-cleverparens paredit editorconfig doom-modeline eldoc-eval shrink-path all-the-icons memoize counsel-projectile counsel swiper centered-cursor-mode browse-at-remote auctex font-lock+ undo-tree dotenv-mode eterm-256color gruvbox-theme key-chord tablist alert log4e gntp markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode request parsebib gitignore-mode fringe-helper git-gutter+ git-gutter pos-tip flycheck pkg-info epl flx magit magit-popup git-commit ghub with-editor smartparens iedit anzu evil goto-chg highlight dash-functional tern company bind-map bind-key biblio biblio-core yasnippet packed anaconda-mode pythonic helm avy helm-core async auto-complete popup f s dash highlight-indent-guides dracula-theme jedi jedi-core python-environment epc ctable concurrent deferred dired-hacks-utils swiper-helm dired-rainbow diredfl dired-narrow beacon seq ranger powerline pdf-tools ivy org-plus-contrib multiple-cursors insert-shebang hydra projectile helm-bibtex flyspell-correct fish-mode company-shell yapfify xterm-color ws-butler winum whole-line-or-region which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox origami orgit org-ref org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text move-dup monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide hy-mode hungry-delete htmlize hl-todo highlight-symbol highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diminish diff-hl define-word cython-mode csv-mode company-tern company-statistics company-auctex company-anaconda column-enforce-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822" :family "Bitstream Vera Sans Mono" :foundry "Bits" :slant normal :weight normal :height 96 :width normal)) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C" :family "Bitstream Vera Sans Mono" :foundry "Bits" :slant normal :weight normal :height 96 :width normal))))
 '(helm-source-header ((t (:background "black" :foreground "tomato")))))
)
