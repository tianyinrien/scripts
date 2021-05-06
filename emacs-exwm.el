(toggle-frame-fullscreen)
;;; Mirror Source
;; (setq package-archives
;;       '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;         ))
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(require 'package)

;;; Init Packages
(package-initialize)

;;; Init Use Package
(unless package-archive-contents
  (package-refresh-contents))

;; ;; install package
;; (setq package-selected-packages
;;    '(smart-mode-line esh-autosuggest esh-help eshell-syntax-highlighting yasnippet-snippets disable-mouse github-search guide-key-tip showtip walkclj whitespace-cleanup-mode scratch-message flycheck-aspell flycheck spaceline-all-the-icons all-the-icons-dired perspective ace-window dashboard doom-themes fzf pdf-tools smartparens company-math company-box company yasnippet browse-kill-ring auctex ivy-posframe avy counsel ivy which-key))
 
;; (mapcar (lambda (p) (unless (package-installed-p p) (package-install p t)))
;; 	package-selected-packages)

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)
;; (setq exwm-workspace-number 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(doom-gruvbox-light))
 '(custom-safe-themes
   '("d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(package-selected-packages
   '(smart-mode-line esh-autosuggest esh-help eshell-syntax-highlighting yasnippet-snippets disable-mouse github-search guide-key-tip showtip walkclj whitespace-cleanup-mode scratch-message flycheck-aspell flycheck spaceline-all-the-icons all-the-icons-dired perspective ace-window dashboard doom-themes fzf pdf-tools smartparens company-math company-box company yasnippet browse-kill-ring auctex ivy-posframe avy counsel ivy which-key)))

(setq sml/theme 'respectful)
(sml/setup)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(display-time-mode 1)
(menu-bar-mode 0)
(line-number-mode 0)
(display-battery-mode 1)
(global-hl-line-mode t)
(add-hook 'emacs-lisp-mode-hook 'menu-bar--display-line-numbers-mode-relative)

;;; dired config
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;;; dashboard config
(dashboard-setup-startup-hook)
(setq dashboard-center-content t
      dashboard-set-navigator t
      dashboard-set-file-icons t)

;;; font setting
 (set-frame-font "-ADBO-Source Code Pro-semibold-normal-normal-*-28-*-*-*-m-0-iso10646-1")
;(set-frame-font "-PfEd-agave Nerd Font Mono-normal-normal-normal-*-34-*-*-*-m-0-iso10646-1")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-2-face ((t (:height 1.1)))))

;;; which-key config
(which-key-mode t)

;;; smartparens config
(smartparens-global-mode t)

;;; yasnippet config
(yas-global-mode t)

;;; save place auto
(save-place-mode t)

;;; ivy config
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key (kbd "C-c C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c f") 'counsel-describe-function)
(global-set-key (kbd "C-c v") 'counsel-describe-variable)
(global-set-key (kbd "C-c o") 'counsel-describe-symbol)
(global-set-key (kbd "C-c l") 'counsel-find-library)
(global-set-key (kbd "C-c i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-c u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;; ivy-posframe
;; (require 'ivy-posframe)
;; (setq ivy-posframe-display-functions-alist
;;      '((swiper          . ivy-display-function-fallback)
;;        (complete-symbol . ivy-posframe-display-at-point)
;;        (t               . ivy-posframe-display)))
;; (ivy-posframe-mode t)
;; (setq ivy-posframe-border-width 10)
;; (setq ivy-posframe-parameters
;;      '((left-fringe . 18)
;; 	(right-fringe . 18)))


;;; latex setting

;; AuCTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'flycheck-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'menu-bar--display-line-numbers-mode-relative)
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)

;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-hook 'LaTeX-mode-hook
          (lambda ()
	    (LaTeX-add-environments
	     '("theorem" LaTeX-env-label)
             '("lemma" LaTeX-env-label)
	     '("corollary" LaTeX-env-label)
	     '("proposition" LaTeX-env-label)
    	     '("remark" LaTeX-env-label)
     	     '("definition" LaTeX-env-label)
	     '("example" LaTeX-env-label)
	     )))

;; Add pair in TeX 
(setq TeX-electric-math '("$" . "$"))
(setq TeX-electric-sub-and-superscript t)

;; Add label insert flags
(setq reftex-insert-label-flags '("sLHCPRDE" "sftLHCPRDE"))

;; Add label list
(setq reftex-label-alist
   '(("lemma" ?L "lem:"  "~\\ref{%s}" nil ("lemma" "le."))
     ("theorem" ?H "thm:" "~\\ref{%s}" t   ("theorem" "theor." "th."))
     ("corollary" ?C "cor:" "~\\ref{%s}" t ("corollary" "corol." "co."))
     ("proposition" ?P "pro:" "~\\ref{%s}" t ("proposition" "prop." "pr."))
     ("remark" ?R "rmk:" "~\\ref{%s}" t ("remark" "rem." "re."))
     ("definition" ?D "def:" "~\\ref{%s}" t ("definition" "def." "de."))
     ("example" ?E "exp:" "~\\ref{%s}" t ("example" "exa." "ex."))
     ))

;; Activate nice interface between RefTeX and AUCTeX
(setq reftex-plug-into-AUCTeX t)

;; pdf-preview setting
(pdf-tools-install)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
;(add-hook 'pdf-tools-enabled-hook 'pdf-view-set-slice-from-bounding-box)
(add-hook 'TeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
     TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

;; preview latex scale
(set-default 'preview-scale-function 2.2)


;;; company config
(global-company-mode t)

(setq company-minimum-prefix-length 1
      company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-tooltip-offset-display 'lines
      company-tooltip-width-grow-only t
      company-tooltip-margin 4
      company-tooltip-maximum-width 40
      company-tooltip-minimum-width 40
      company-idle-delay 0.5)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))
(push 'company-capf company-backends)

;; local configuration for TeX modes
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex company-yasnippet))
                      company-backends)))

(add-hook 'TeX-mode-hook 'my-latex-mode-setup)

(global-set-key (kbd "C-x 9") (lambda() (interactive)
				(split-window-horizontally 63)
				(TeX-view)))

;; (require 'company-box)
;; (add-hook 'company-mode-hook 'company-box-mode)


;;; proxy setting 
(defun toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
	(setq url-proxy-services
	      '(("http" . "127.0.0.1:8001")
		("https" . "127.0.0.1:8001")))
	      (message "the proxy is open."))
    (setq url-proxy-services nil)
    (message "the proxy is closed.")))

(toggle-proxy)


;;; some other keybinds
(global-set-key (kbd "C-; f") 'fzf-directory)
(global-set-key (kbd "C-; t") 'load-theme)
(global-set-key (kbd "C-; v") 'customize-variable)
(global-set-key (kbd "M-e") 'eshell)
(global-set-key (kbd "C-c C-m") 'clipboard-yank)
(global-set-key (kbd "C-; w") 'ace-window)

