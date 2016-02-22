(add-to-list 'load-path
             "~/Documents/emacs/site-lisp/matlab_emacs")
(load-library "matlab-load")
;; Enable CEDET feature support for MATLAB code. (Optional)
;;(matlab-cedet-setup)

(setq matlab-indent-function-body t)  ; if you want function bodies indented
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 76))		; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
  '())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
(global-font-lock-mode t); syntax highlighting

(setq matlab-mode-install-path (list "/usr/local/MATLAB/R2015b/toolbox"))

(provide 'init-matlab)
