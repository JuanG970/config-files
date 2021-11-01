;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Juan Angel Gonzalez"
      user-mail-address "juan.angel19@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
(setq doom-font (font-spec :family "IBM Plex Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Latin Modern Roman" :size 14)
      )
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)
(blink-cursor-mode 1)

(auto-save-visited-mode t)
(auto-revert-mode t)

;; ORG Config
(after! org
  (setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/"
        org-log-done 'time
        org-agenda-include-diary t
        diary-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/diary.org"
        org-fontify-done-headline t
        org-hide-leading-stars t
        org-pretty-entities t
        org-clock-persist 'history
        org-ellipsis "⬐"
        org-checkbox-hierarchical-statistics nil
        org-capture-templates
      '(("t" "To-Do" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/inbox.org" "Inbox") "** TODO %?\n %l")
        ("n" "Note" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org" "Inbox") "** %?\n %a")
        )
        org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WIP(w)" "HOLD(h)" "|" "DONE(d)")
        (sequence "QUICK(r)" "PROJ(p)" "DELEGATE(g)" "SOMEDAY(s)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)"))
      org-todo-keyword-faces
      '(("QUICK" . "orange") ("DELEGATE" . "gold") ("HOLD" . "magenta") ("NEXT" . "purple") ("CANCELED" . "firebrick") ("PROJ" . "deep sky blue") ("SOMEDAY" . "plum") ("DONE" . "light gray") ("WIP" . "olive drab"))
      org-agenda-custom-commands
      '(
        ("d" "GTD"
         (
          (agenda "" ((org-agenda-span 7)))
          (todo "WIP") ; GTD next and quick
          (todo "NEXT|QUICK") ; GTD next and quick
          (todo "DELEGATE")
          (stuck "") ; review stuck projects as designated by org-stuck-projects
          )
         )
        ("W" "Weekly review"
               agenda ""
               ((org-agenda-span 'week)
                (org-agenda-start-on-weekday 0)
                (org-agenda-start-with-log-mode t)
                (org-agenda-skip-function
                 '(org-agenda-skip-entry-if 'nottodo 'done))
                 ))
        )
      org-stuck-projects
      '("TODO={.+}/-SOMEDAY" ("NEXT" "WIP" "DONE" "HOLD" "CANCELED") nil "SCHEDULED:\\|DEADLINE:"
        )
        ;;org-pomodoro-play-sounds nil
        org-taskjuggler-default-reports
        '("textreport report \"Plan\" {
        formats html
        header '== %title =='
        center -8<-
        [#Plan Plan] | [#Resource_Allocation Resource Allocation]
        ----
        === Plan ===
        <[report id=\"plan\"]>
        ----
        === Resource Allocation ===
        <[report id=\"resourceGraph\"]>
        ->8-
        }
        # A traditional Gantt chart with a project overview.
        taskreport plan \"\" {
        headline \"Project Plan\"
        columns bsi, name, effort, start, end, complete, gauge, chart { width 5000 }
        loadunit shortauto
        hideresource 1
        }
        # A graph showing resource allocation. It identifies whether each
        # resource is under- or over-allocated for.
        resourcereport resourceGraph \"\" {
        headline \"Resource Allocation Graph\"
        columns no, name, effort, weekly { width 1000 }
        loadunit shortauto
        hidetask ~(isleaf() & isleaf_())
        sorttasks plan.start.up
        }")
        org-latex-to-mathml-convert-command "java -jar %j -unicode -force -df %o %I"
        org-latex-to-mathml-jar-file "~/JAR_Files/mathtoweb.jar"
        bibtex-dialect 'biblatex
        org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f")
      )
  (org-clock-persistence-insinuate)
  (custom-theme-set-faces
   'user
   `(org-level-6 ((t (:inherit default))))
   `(org-level-5 ((t (:inherit default))))
   `(org-level-4 ((t (:inherit default))))
   `(org-level-3 ((t (:inherit default))))
   `(org-level-2 ((t (:inherit default :foreground "#33A8FF"))))
   `(org-level-1 ((t (:foreground "#33A8FF"))))
   `(org-document-title ((t (:foreground "#2874A6" :height 2.0))))
   `(org-block ((t (:inherit default))))
   )
  (defun my/org-mode/load-prettify-symbols () "Prettify org mode keywords"
         (interactive)
         (setq prettify-symbols-alist
               (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                       '(("#+begin_src" . ?)
                         ("#+end_src" . ?)
                         ("#+begin_example" . ?)
                         ("#+end_example" . ?)
                         ("#+DATE:" . ?⏱)
                         ("#+AUTHOR:" . ?✏)
                         ("[ ]" .  ?☐)
                         ("[X]" . ?☑ )
                         ("[-]" . ?❍ )
                         ("lambda" . ?λ)
                         ("#+header:" . ?)
                         ("#+name:" . ?﮸)
                         ("#+results:" . ?)
                         ("#+call:" . ?)
                         (":properties:" . ?)
                         (":logbook:" . ?))))
         (prettify-symbols-mode 1)
         )
  (add-to-list 'org-src-lang-modes (cons "mma"  'wolfram)
               (cons "mathematica"  'wolfram)
               )

  ;; Font-locking
  (setq org-babel-mathematica-command "/usr/local/bin/wolframscript -script")
  ;; Load languages
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((mathematica . t))
                                       '((Shell . t))
                                       '((python . t))
                                       '((latex . t))
                                       '((gnuplot . t))
                                       '((dot . t))
                                       ))
   (add-to-list 'org-latex-packages-alist '("" "listings"))
   (setq org-latex-listings 'listings)
   (custom-theme-set-faces
    'user
    `(org-level-4 ((t (:inherit default :height 1.1))))
    `(org-level-3 ((t (:inherit default :height 1.2))))
    `(org-level-2 ((t (:inherit default :height 1.3 :foreground "#33A8FF"))))
    `(org-level-1 ((t (:height 1.5 :foreground "#33A8FF"))))
    `(org-document-title ((t (:foreground "#2874A6" :height 2.0))))
 )
(use-package org-fancy-priorities
  :after org
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("!!!" "!!" "!" "o"))
)

) ;;;;;;; AFTER ORG MODE FINISHES HERE
;; Other ORG Configs
(add-hook! org-mode :append
           #'visual-line-mode
;;           #'variable-pitch-mode)
)
;; Mathematica config
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))
(autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
(setq wolfram-program "/Applications/Mathematica.app/Contents/MacOS/MathKernel"
      wolfram-path "direcotry-in-Mathematica-$Path"
)

(after! ob-mathematica
  (add-to-list 'org-src-lang-modes (cons "mathematica"  'wolfram))
  )
(defun my-org-latex-yas ()
  "Activate org and LaTeX yas expansion in org-mode buffers."
  (yas-minor-mode)
  (yas-activate-extra-mode 'latex-mode))

(add-hook 'org-mode-hook #'my-org-latex-yas)

;; Config org roam
(setq org-roam-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/Second_Brain")

;;;; This determines the style of line numbers in effect. If set to `nil', line
;;;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)
;;
;;;; BiBTeX
;;
;;;; Key bindings
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
;;
;;;; PlantUML config TODO
(setq org-plantuml-jar-path "~/JAR_Files/plantuml.jar")
(setq plantuml-jar-path (expand-file-name "~/plantuml.jar"))
(setq plantuml-default-exec-mode 'jar)

;; Auto-complete settings
(setq company-minimum-prefix-length 5
      company-idle-delay 1.100)
(add-hook 'after-init-hook 'global-company-mode)
(setq flycheck-check-syntax-automatically '(save mode-enable))

(defun my/python-mode-hook ()
(add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'run-python-internal)

;; Projectile config
(setq projectile-ignored-projects '("~/"
                                    ))
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
;; Disable Projectile when working over tramp
(add-hook 'find-file-hook
          (lambda ()
            (when (file-remote-p default-directory)
              (setq-local projectile-mode-line "Projectile"))))

;; iSpell configuration
(setq ispell-dictionary "es")

(defun set-system-dark-mode ()
(interactive)
(if (string= (shell-command-to-string "printf %s \"$( osascript -e \'tell application \"System Events\" to tell appearance preferences to return dark mode\' )\"") "true")
(setq doom-theme 'doom-one)
(setq doom-theme 'doom-one-light)
)
)
(set-system-dark-mode)

;; LiLypond
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.lytex$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))


;; Modeline Config
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
  (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode -1)
  (setq doom-modeline-buffer-encoding nil))

;;(require 'org-ref)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
