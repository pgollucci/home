(package 'markdown-mode)
(package 'markdown-mode+)
(package 'gh-md)
(package 'markdown-toc)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(global-set-key (kbd "C-x gb") 'gh-md-render-buffer)
