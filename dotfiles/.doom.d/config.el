;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(setq avy-all-windows t)
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/Users/jkirkwood/Library/Application Support/Coursier/bin")
(after! evil-snipe
  (evil-snipe-mode -1))
(defun intellij ()
  (interactive)
  (start-process-shell-command "idea" "idea-buffer" (format "'/Applications/IntelliJ IDEA CE.app/Contents/MacOS/idea' %s --line %d %s" (projectile-project-root) (count-lines 1 (point)) buffer-file-name)))
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;(defun term-insert-literal (key)
;    "Take a keypress and insert it literally into a terminal."
;    (interactive "cPress key:")
;    (term-send-raw-string (format "%c" key))
;    )
;(defun term-reverse-search ()
;    (term-send-raw-string "i")
;    #'vterm-send-C-r)
;(defun clear-line ()
;   (term-send-raw-string "d")
;    (term-send-raw-string "$"))
;(defun custom-term-del-char ()
;    (vterm-send-right)
;    (vterm-send-delete))
 (map! :leader
       :desc "vterm-send-escape" "a" #'vterm-send-escape)
; (evil-define-key 'insert global-map (kbd "C-a") 'vterm-send-escape)
;(evil-define-key 'insert global-map (kbd "C-j") #'vterm-send-C-j)
;(evil-define-key 'normal vterm-mode-map (kbd "k") #'vterm-send-up)
;(evil-define-key 'normal vterm-mode-map (kbd "j") #'vterm-send-down)
;(evil-define-key 'insert vterm-mode-map (kbd "C-k") #'vterm-send-up)
;(evil-define-key 'insert vterm-mode-map (kbd "C-j") #'vterm-send-down)
;(map! :after vterm :map vterm-mode-map :n "S-c" (clear-line))
;(evil-define-key 'normal vterm-mode-map  (kbd "/") (term-reverse-search))
;(map! :after vterm :map vterm-mode-map :n "x" (custom-term-del-char))
;(map! :map ivy-minibuffer-map "C-k" #'ivy-previous-line)
;(map! :map ivy-minibuffer-map "C-j" #'ivy-next-line)
;(map! :leader (:prefix "o") "j" #'intellij)
;(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
;(map! :leader (:prefix "t") "e" #'vterm-send-escape)
(defun ++open-shell-new-window ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (+vterm/here "/"))

;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(with-eval-after-load 'git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  ;; force update evil keymaps after git-timemachine-mode loaded
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))
(setq org-roam-directory "${HOME}/roam")
