;(load-theme 'wombat)

;(set-cursor-color "orange")
;(set-face-attribute 'region nil :background "cornflower blue")
;(set-face-attribute 'isearch nil :background "gold" :foreground "black")
;(set-face-attribute 'lazy-highlight nil :background "dark goldenrod" :foreground "white")

(package 'alect-themes)
(load-theme 'alect-black)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))
