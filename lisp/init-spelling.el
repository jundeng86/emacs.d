;;(require 'ispell)
(when *is-a-mac*
   (after-load 'ispell
               (setq ispell-program-name "/usr/local/bin/aspell")))

(require 'flyspell)
(require 'init-flyspell)

(provide 'init-spelling)
