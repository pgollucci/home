(package 'ibuffer-vc)

(add-hook 'ibuffer-hook
	  (lambda ()
	    (ibuffer-vc-set-filter-groups-by-vc-root)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	      (ibuffer-do-sort-by-alphabetic))))

(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
	      (name 18 18 :left :elide)
	      " "
	      (size 9 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      (vc-status 16 16 :left)
	      " "
	      filename-and-process)))

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer-vc)
