;;; some self-defined 

;; make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)
;; make ctrl-Z redo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'redo)

(require-package 'monokai-theme)

(load-theme 'monokai t)

(provide 'init-local)
