;; setup
;; ---------------------
(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/personal/defuns")

(add-to-list 'load-path "~/.emacs.d/vendor/")

;; elpa managed
;; ------------------
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(package 'auto-complete)
(package 'popup)
(package 'magit)
(package 'flx-ido)
(package 'flx-isearch)
(package 'yasnippet)

(package 'ruby-guard)
(package 'js3-mode)

;; mine
;; ------------------
(personal 'auto-complete)
(personal 'bindings)
(personal 'global)
(personal 'ido)
(personal 'server-mode)
(personal 'theme)
(personal 'utf8)

;; languages
;; ------------------
(personal 'js3-mode)

;; submodule managed
;; ------------------

