;; Smooth scroll (http://www.emacswiki.org/emacs/smooth-scroll.el)
(add-to-list 'load-path "~/.emacs.d/vendor/smooth-scroll/")
(require 'smooth-scroll)
(smooth-scroll-mode t)


;; SCSS mode (https://github.com/antonj/scss-mode/)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scss-mode/"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.less\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)


;; Emmet (https://github.com/smihica/emmet-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)                     ; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode)                     ; Enable Emmet's css abbreviation
(setq emmet-preview-default nil)                           ; Disable preview before expanding
(setq emmet-move-cursor-between-quotes t)                  ; Move the cursor to next edit point
(global-set-key (kbd "<M-left>") 'emmet-prev-edit-point)   ; Jump to previous empty edit point
(global-set-key (kbd "<M-right>") 'emmet-next-edit-point)  ; Jump to next empty edit point
(eval-after-load "scss-mode"
  '(define-key emmet-mode-keymap (kbd "C-S-c C-S-c") nil))
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))


;; Multiple cursors (https://github.com/magnars/multiple-cursors.el)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(setq mc/list-file "~/.emacs.d/vendor/multiple-cursors/mc-lists.el")


;; Expand region (https://github.com/magnars/expand-region.el)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(pending-delete-mode t)


;; Projectile (https://github.com/bbatsov/projectile)
(setq projectile-enable-caching t)
(setq projectile-remember-window-configs t)
(setq projectile-mode-line '(:eval (format " %s" (projectile-project-name))))
(projectile-global-mode)
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)


;; Company (https://github.com/company-mode/company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.1)


;; Anaconda backend for Company (https://github.com/proofit404/company-anaconda)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-anaconda))


;; Anaconda (https://github.com/proofit404/anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

;; Ace Jump Mode (https://github.com/winterTTr/ace-jump-mode)
(define-key global-map (kbd "C-f") 'ace-jump-mode)
;; Enable a more powerful jump back function from ace jump mode
(autoload 'ace-jump-mode-pop-mark "ace-jump-mode" "Ace jump back" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c f") 'ace-jump-mode-pop-mark)


;; Hightlight Parentheses (http://www.emacswiki.org/emacs/HighlightParentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


;; Autopair (https://github.com/capitaomorte/autopair)
(autopair-global-mode)
