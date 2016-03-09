(setq confluence-url "http://intranet/confluence/rpc/xmlrpc")
(global-set-key "\C-xwf" 'confluence-get-page)

(add-hook 'confluence-mode-hook
	  (local-set-key "\C-xw" confluence-prefix-map)
	  (local-set-key "\M-j" 'confluence-newline-and-indent)
	  (local-set-key "\M-;" 'confluence-list-indent-dwim))
