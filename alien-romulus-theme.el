;;; alien-romulus-theme.el --- A theme inspired by the terminals in Alien: Romulus

;; Copyright (C) 2026

;; Author: Peter Evjan

;; Version: 1.0
;; Package-Requires: ((emacs "24"))

;;; Commentary:

;; A dark theme inspired by the retro CRT terminals seen in Alien: Romulus.
;; Features cyan/green primary text, amber highlights, and a dark brown-black background.

;;; Code:

(deftheme alien-romulus
  "A theme inspired by the terminals in Alien: Romulus.")

(let ((class '((class color) (min-colors 89)))
      ;; Primary palette from the terminal screen
      (bg-dark     "#0a0a08")    ; Very dark brown-black background
      (bg-darker   "#050503")    ; Even darker for depth
      (bg-lighter  "#1a1812")    ; Slightly lighter for contrast
      
      (cyan-bright "#4affd0")    ; Bright cyan for "RETURN PROTOCOL"
      (cyan-main   "#3dd4b0")    ; Main cyan for primary text
      (cyan-dim    "#2a9580")    ; Dimmer cyan
      
      (amber       "#ffb366")    ; Amber/orange for highlights
      (amber-dim   "#cc8844")    ; Dimmer amber
      
      (yellow      "#d4b847")    ; Yellow-gold for warnings
      (green-dim   "#4a7a5a")    ; Muted green
      
      (gray        "#6a6854")    ; Gray for comments
      (gray-dim    "#3a3830")    ; Darker gray
      
      (red         "#ff6b5a")    ; Red for errors
      (red-dim     "#aa4438"))   ; Dimmer red

  (custom-theme-set-faces
   'alien-romulus

   ;; Basic faces
   `(default ((,class (:foreground ,cyan-main :background ,bg-dark))))
   `(cursor ((,class (:background ,amber))))
   `(region ((,class (:background ,bg-lighter))))
   `(highlight ((,class (:background ,bg-lighter))))
   `(hl-line ((,class (:background ,bg-lighter))))
   `(fringe ((,class (:background ,bg-darker))))
   `(mode-line ((,class (:foreground ,cyan-bright :background ,bg-lighter :box nil))))
   `(mode-line-inactive ((,class (:foreground ,gray :background ,bg-darker :box nil))))
   `(minibuffer-prompt ((,class (:foreground ,cyan-bright :weight bold))))
   `(vertical-border ((,class (:foreground ,gray-dim))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,cyan-bright))))
   `(font-lock-comment-face ((,class (:foreground ,gray :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,amber))))
   `(font-lock-function-name-face ((,class (:foreground ,cyan-bright :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,amber :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,yellow))))
   `(font-lock-type-face ((,class (:foreground ,cyan-dim))))
   `(font-lock-variable-name-face ((,class (:foreground ,cyan-main))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-doc-face ((,class (:foreground ,green-dim :slant italic))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,gray-dim :background ,bg-darker))))
   `(line-number-current-line ((,class (:foreground ,amber :background ,bg-lighter :weight bold))))

   ;; Search
   `(isearch ((,class (:foreground ,bg-dark :background ,amber :weight bold))))
   `(lazy-highlight ((,class (:foreground ,bg-dark :background ,amber-dim))))

   ;; Links
   `(link ((,class (:foreground ,cyan-bright :underline t))))
   `(link-visited ((,class (:foreground ,cyan-dim :underline t))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,cyan-bright :weight bold :height 1.3))))
   `(org-level-2 ((,class (:foreground ,amber :weight bold :height 1.2))))
   `(org-level-3 ((,class (:foreground ,cyan-main :weight bold :height 1.1))))
   `(org-level-4 ((,class (:foreground ,yellow :weight bold))))
   `(org-level-5 ((,class (:foreground ,cyan-dim :weight bold))))
   `(org-link ((,class (:foreground ,cyan-bright :underline t))))
   `(org-code ((,class (:foreground ,amber))))
   `(org-block ((,class (:background ,bg-darker))))
   `(org-block-begin-line ((,class (:foreground ,gray :background ,bg-darker))))
   `(org-block-end-line ((,class (:foreground ,gray :background ,bg-darker))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,cyan-bright :weight bold))))
   `(dired-symlink ((,class (:foreground ,amber))))
   `(dired-marked ((,class (:foreground ,yellow :weight bold))))

   ;; Compilation
   `(compilation-info ((,class (:foreground ,cyan-bright))))
   `(compilation-warning ((,class (:foreground ,amber :weight bold))))
   `(compilation-error ((,class (:foreground ,red :weight bold))))

   ;; Diff
   `(diff-added ((,class (:foreground ,cyan-bright :background ,bg-darker))))
   `(diff-removed ((,class (:foreground ,red :background ,bg-darker))))
   `(diff-changed ((,class (:foreground ,amber :background ,bg-darker))))
   `(diff-header ((,class (:foreground ,cyan-dim))))

   ;; Magit
   `(magit-branch-local ((,class (:foreground ,cyan-bright :weight bold))))
   `(magit-branch-remote ((,class (:foreground ,amber :weight bold))))
   `(magit-section-heading ((,class (:foreground ,cyan-bright :weight bold))))
   `(magit-hash ((,class (:foreground ,gray))))
   `(magit-diff-added ((,class (:foreground ,cyan-bright :background ,bg-darker))))
   `(magit-diff-removed ((,class (:foreground ,red :background ,bg-darker))))

   ;; Company
   `(company-tooltip ((,class (:foreground ,cyan-main :background ,bg-lighter))))
   `(company-tooltip-selection ((,class (:foreground ,cyan-bright :background ,bg-lighter))))
   `(company-tooltip-common ((,class (:foreground ,amber :weight bold))))
   `(company-scrollbar-bg ((,class (:background ,bg-darker))))
   `(company-scrollbar-fg ((,class (:background ,gray))))

   ;; Ivy/Counsel
   `(ivy-current-match ((,class (:foreground ,cyan-bright :background ,bg-lighter :weight bold))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,amber))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,amber :weight bold))))

   ;; Show-paren
   `(show-paren-match ((,class (:foreground ,amber :background ,bg-lighter :weight bold))))
   `(show-paren-mismatch ((,class (:foreground ,red :background ,bg-lighter :weight bold))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,gray-dim))))
   `(whitespace-tab ((,class (:foreground ,gray-dim))))
   `(whitespace-trailing ((,class (:background ,red-dim))))

   ;; Error and success
   `(error ((,class (:foreground ,red :weight bold))))
   `(warning ((,class (:foreground ,amber :weight bold))))
   `(success ((,class (:foreground ,cyan-bright :weight bold))))

   ;; Escape and prompt
   `(escape-glyph ((,class (:foreground ,amber))))
   `(homoglyph ((,class (:foreground ,amber))))))

(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'alien-romulus)

;;; alien-romulus-theme.el ends here
