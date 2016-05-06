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

(personal 'ace-windows)
(personal 'ag-setup)
(personal 'auto-complete-setup)
(personal 'buffers)
(personal 'bindings)
(personal 'global)
(personal 'ido)
(personal 'jenkins-setup)
(personal 'server-mode)
(personal 'popup-setup)
(personal 'theme)
(personal 'utf8)

; languages
(personal 'confluence-setup)
(personal 'js)
(personal 'markdown-setup)
(personal 'vc)
(personal 'ruby)
(personal 'shell)
(personal 'yaml)
