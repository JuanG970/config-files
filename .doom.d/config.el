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
      doom-variable-pitch-font (font-spec :famility "IBM Plex Sans" :size 14)
      )
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-light)

;; ORG Config
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/"
        org-log-done 'time
        )
  (custom-theme-set-faces
   'user
   `(org-level-4 ((t (:inherit default))))
   `(org-level-3 ((t (:inherit default))))
   `(org-level-2 ((t (:inherit default :foreground "#33A8FF"))))
   `(org-level-1 ((t (:foreground "#33A8FF"))))
   `(org-document-title ((t (:foreground "#2874A6" :height 2.0))))
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
  ;; Load mathematica from contrib
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((mathematica . t))
                                       ))
  (setq org-babel-mathematica-command "/usr/local/bin/wolframscript -script")
  ;; Font-locking
  (add-to-list 'org-src-lang-modes '("mathematica" . wolfram))
)
(custom-theme-set-faces
 'user
 `(org-level-4 ((t (:inherit default :height 1.1))))
 `(org-level-3 ((t (:inherit default :height 1.2))))
 `(org-level-2 ((t (:inherit default :height 1.3 :foreground "#33A8FF"))))
 `(org-level-1 ((t (:height 1.5 :foreground "#33A8FF"))))
 `(org-document-title ((t (:foreground "#2874A6" :height 2.0))))
 )


;; Mathematica config TODO
(autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
(after! wolfram-mode
  (setq wolfram-program "/Applications/Mathematica.app/Contents/MacOS/WolframKernel -script")
)
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))
(setq wolfram-path "/~/Library/Mathematica") ;; e.g. on Linux ~/.Mathematica/Applications
;; For wolfram-mode
(setq mathematica-command-line "/Applications/Mathematica.app/Contents/MacOS/WolframKernel")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; Key bindings
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; PlantUML config TODO
(setq org-plantuml-jar-path "Users/juangonzalez/plantuml.jar")
(setq plantuml-jar-path (expand-file-name "/Users/juangonzalez/plantuml.jar"))


;;
;; Auto-complete settings
(setq company-minimum-prefix-length 3
      company-idle-delay 0.800)

;; Disable Projectile when working over tramp
(add-hook 'find-file-hook
          (lambda ()
            (when (file-remote-p default-directory)
              (setq-local projectile-mode-line "Projectile"))))

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
