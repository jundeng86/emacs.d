;;;

;;;:configure of ac-math

(require-package 'ac-math)
(require 'ac-math)

(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )

(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; configuire of auctex with auto-complete
;;(add-hook 'LaTeX-mode-hook 'auto-complete-auctex)


;; Auctex
(require-package 'auctex)
(load "auctex.el" nil t t)
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))
                                        ;(load "preview-latex.el" nil t t) ; ; ; ; ; ;
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) ;turn on pdf-mode.
(setq TeX-PDF-mode t)                     ; to compile documents to PDF by default
(add-hook 'LaTeX-mode-hook  ;; automatically insert double dollar symbols
          '(lambda ()
             (define-key LaTeX-mode-map (kbd "$") 'skeleton-pair-insert-maybe)))

(add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.

(setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")));change pdf viwer as Evince
(setq TeX-view-program-selection '((output-pdf "Evince")))

(when *is-a-mac*
  (after-load 'auctex
              (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))))
              
;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(when *is-a-mac*
  (after-load 'auctex
              (setq TeX-view-program-list'(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
                                        ; multifile documents ; ; ; ; ; ;
                                        ;(setq-default TeX-master "master") ; All master files called "master". ; ; ; ; ; ;

;;Inserting and wrapping single quotes
(defun TeX-insert-single-quote (arg)
  (interactive "p")
  (cond
   (mark-active
    (let ((skeleton-end-newline nil))
      (skeleton-insert
       `(nil ?` _ ?') -1)))
   ((or (looking-at "\\<")
        (looking-back "^\\|\\s-\\|`"))
    (insert "`"))
   (t
    (self-insert-command arg))))

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (local-set-key "'" 'TeX-insert-single-quote)))

;; Forward/inverse search with evince using D-bus.

(custom-set-variables
 '(LaTeX-command "latex -synctex=1"))

(require 'auctex-evince-sync)

;; ============ Latexmk setup ==============
(require-package 'auctex-latexmk)
(require 'auctex-latexmk)
(auctex-latexmk-setup)

(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "LatexMk")))

;; RefTex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
(setq reftex-external-file-finders
      '(("tex" . "kpsewhich -format=.tex %f")
        ("bib" . "kpsewhich -format=.bib %f")))

;; Automatic Parsing of TeX Files
(setq TeX-parse-self t ; Enable parse on load.
      TeX-auto-save t ; Enable parse on save.
      LaTeX-math-mode t ; ` will read a character from the keyboard,
                                        ; and insert the symbol as specified... ; ; ; ; ; ;
      TeX-electric-sub-and-superscript t ; If non-nil, insert braces
                                        ; after typing  and  in ; ; ; ; ; ;
                                        ; math mode. ; ; ; ; ; ;
      )
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

;; Customize auctex when using
;; To highlight (or font-lock) the "\section{title}" lines
(font-lock-add-keywords
 'latex-mode
 `((,(concat "^\\s-*\\\\\\("
             "\\(documentclass\\|\\(sub\\)?section[*]?\\)"
             "\\(\\[[^]% \t\n]*\\]\\)?{[-[:alnum:]_ ]+"
             "\\|"
             "\\(begin\\|end\\){document"
             "\\)}.*\n?")
    (0 'your-face append))))

(defadvice TeX-parse-reset (after make-master-file-default () activate)
  (push (concat (substring (buffer-name) 1 (- (length (buffer-name)) 8)) "." TeX-default-extension) TeX-error-file)
  (push nil TeX-error-offset))

(defun demolish-tex-help ()
  (interactive)
  (if (get-buffer "*TeX Help*") ;; Tests if the buffer exists
      (progn ;; Do the following commands in sequence
        (if (get-buffer-window (get-buffer "*TeX Help*")) ;; Tests if the window exists
            (delete-window (get-buffer-window (get-buffer "*TeX Help*")))
          ) ;; That should close the window
        (kill-buffer "*TeX Help*") ;; This should kill the buffer
        )
    )
  )
;; filling
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(provide 'init-latex)
