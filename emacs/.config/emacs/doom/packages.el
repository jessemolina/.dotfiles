;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; custom

;; org-roam-ui
(package! websocket)
(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))

;; rust docs
;;(package! rust-docs)

(package! ob-mermaid)
