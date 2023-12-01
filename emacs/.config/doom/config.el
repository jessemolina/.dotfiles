;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; defaults

(setq user-full-name "Jesse Molina"
      user-mail-address "jesse@jessemolina.xyz")

(setq doom-theme 'wheatgrass)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Documents/org/")

;; custom

;; deft
(setq deft-directory "~/Documents/org"
      deft-extensions '("org" "txt")
      deft-recursive t)

;; godef
(map! :leader
      :desc "godef other window"
      "m h D" #'godef-describe)


(map! :leader
      :desc "godef other window"
      "m h J" #'godef-jump-other-window)

(map! :leader
      :desc "godef this window"
      "m h j" #'godef-jump)

;; gofmt
(map! :leader
      :desc "gofmt"
      "m f" #'gofmt)

;; lsp-ui-doc
(after! lsp-ui
  (setq lsp-ui-doc-show-with-mouse t))

(map! :leader
      :desc "Glance document"
      "c g" #'lsp-ui-doc-glance)

;; org-agenda
(setq org-agenda-files (quote ("~/Documents/org/agenda")))

(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Current Focus:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (air-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))

;; org-roam
(setq org-roam-directory "~/Documents/org/roam"
      org-roam-completion-everywhere t
      org-roam-dailies-directory "dailies/"
      org-roam-capture-templates
      '(("d" "draft" plain
         (file "~/Documents/org/templates/draft.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("s" "subject" plain
         (file "~/Documents/org/templates/wiki.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("r" "resource" plain
         (file "~/Documents/org/templates/resource.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("p" "person" plain
         (file "~/Documents/org/templates/person.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("l" "log" plain
         (file "~/Documents/org/templates/log.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        )
      org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%H:%M>\n%?"
         :if-new (file+head "%<%Y%m%d>.org" "#+title: %<%A, %Y-%m-%d>\n"))))

;; org-roam-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; projectile
(setq
 projectile-project-search-path '("~/Lab"))
