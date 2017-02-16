(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)
(require-package 'elpy)
(elpy-enable)

;; set ipython as the python shell
(elpy-use-ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-prompt-detect-failure-warning nil)

(provide 'init-python-mode)
