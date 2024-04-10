;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(defvar my-directory-org(concat (getenv "DOCUMENTS") "/org")
  "Path to my org directory.")
(defvar my-directory-org-agenda(concat my-directory-org  "/agenda")
  "Path to my org agenda directory.")
(defvar my-directory-org-roam(concat my-directory-org  "/roam")
  "Path to my org agenda directory.")
(defvar my-directory-org-templates(concat my-directory-org  "/templates")
  "Path to my org templates directory.")

(setq user-full-name "Jesse Molina"
      user-mail-address "jesse@jessemolina.xyz")

(setq doom-theme 'doom-ir-black)

(setq doom-font (font-spec :family "Fira Code" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Code"))

(setq display-line-numbers-type 'relative)

(setq org-directory my-directory-org)

(setq display-time-format "%H:%M")
(display-time-mode 1)

;; deft
(setq deft-directory my-directory-org
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

;; ob-mermaid
(setq ob-mermaid-cli-path "/usr/bin/mmdc")
(after! org (add-to-list 'org-babel-load-languages '(mermaid . t)))

;; org-agenda
(setq org-agenda-files (list my-directory-org-agenda))

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
(setq org-roam-directory my-directory-org-roam
      org-roam-completion-everywhere t
      org-roam-dailies-directory "dailies/"
      org-roam-capture-templates
      '(("d" "draft" plain
         (file concat(my-directory-org-templates "/draft.org"))
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("s" "subject" plain
         (file concat(my-directory-org-templates "/wiki.org"))
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("r" "resource" plain
         (file concat(my-directory-org-templates "/resource.org"))
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("p" "person" plain
         (file concat(my-directory-org-templates "/person.org"))
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
         :unnarrowed t)
        ("l" "log" plain
         (file concat(my-directory-org-templates "/log.org"))
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

