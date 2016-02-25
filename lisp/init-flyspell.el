;;----------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes
;;----------------------------------------------------------------------------
(if (fboundp 'prog-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (dolist (hook '(lisp-mode-hook
                  emacs-lisp-mode-hook
                  scheme-mode-hook
                  clojure-mode-hook
                  ruby-mode-hook
                  yaml-mode
                  python-mode-hook
                  shell-mode-hook
                  php-mode-hook
                  css-mode-hook
                  haskell-mode-hook
                  caml-mode-hook
                  nxml-mode-hook
                  crontab-mode-hook
                  perl-mode-hook
                  tcl-mode-hook
                  LaTex-mode-hook
                  lua-mode-hook
                  matlab-mode-hook
                  org-mode-hook
                  javascript-mode-hook))
    (add-hook hook 'flyspell-prog-mode)))

(after-load 'flyspell
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face))

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)           ;enable flyspell for Org

(setq flyspell-use-meta-tab nil)
;; Binding for `flyspell-auto-correct-previous-word'
(setq flyspell-auto-correct-binding (kbd "<f12>"))

(defun modi/ispell-not-avail-p (&rest args)
  "Return `nil' if `ispoell-program-name' is available; `t' otherwise."
  (not (executable-find ispell-program-name)))
(advice-add 'turn-on-flyspell   :before-until #'modi/ispell-not-avail-p)
(advice-add 'flyspell-prog-mode :before-until #'modi/ispell-not-avail-p)

(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "american") "british" "american")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))

(global-set-key (kbd "<f8>")   'fd-switch-dictionary)

(require-package 'flyspell-popup)
(define-key flyspell-mode-map (kbd "C-'") #'flyspell-popup-correct)

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(provide 'init-flyspell)
