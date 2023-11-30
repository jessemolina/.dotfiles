;; Disable the startup screen
(setq inhibit-startup-screen t)

;; Enable line numbers
(global-display-line-numbers-mode)

;; Set the default font
;;(set-default-font "Monospace 12")

;; Enable line wrapping
(global-visual-line-mode t)

;; Enable syntax highlighting
(global-font-lock-mode t)

;; Enable mouse support
(xterm-mouse-mode 1)

;; Enable clipboard integration
(setq select-enable-clipboard t)

;; Set the default tab width to 4 spaces
(setq-default tab-width 4)

;; Enable auto-indentation
(electric-indent-mode t)

;; Enable backup files in a central directory
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backups"))))

;; Enable auto-save files in a central directory
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.d/auto-saves/") t)))

;; Customize your key bindings here (if needed)
;; Example: (global-set-key (kbd "C-x C-b") 'buffer-menu)

;; Add any additional packages or configurations here

;; Save your customizations
(provide 'init)

