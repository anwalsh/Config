;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; SPC f e-R
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory nil)
     asm
     (c-c++ :variables
            c-c++-backend 'lsp-ccls
            c-c++-enable-clang-format-on-save t
            c++-enable-organize-includes-on-save t
            c-c++-enable-google-style t
            c-c++-enable-google-newline t
            c-c++-default-mode-for-headers 'c++-mode)
     csharp
     csv
     dap
     docker
     emacs-lisp
     evil-commentary
     git
     github
     (go :variables
         go-backend 'lsp
         go-tab-width 4
         go-use-golangci-lint t
         godoc-at-point-function 'godoc-gogetdoc
         go-format-before-save t
     )
     (gtags :variables
            gtags-enable-by-default nil)
     helm
     html
     (java :variables
           java-backend 'lsp)
     (javascript :variables
                 javascript-backend 'lsp
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 javascript-import-tool 'import-js)
     (json :variables
           json-fmt-tool 'prettier)
     (lsp :variables
          lsp-navigation 'peek)
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     multiple-cursors
     (org :variables
          org-enable-github-support t
          org-enable-jira-support t)
     (prettier :variables
               prettier-js-show-errors 'echo)
     (python :variables
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t
             python-backend 'lsp)
     (ruby :variables
           ruby-backend 'lsp)
     ruby-on-rails
     (rust :variables
           rust-backend 'lsp
           rust-rls-cmd '("rustup" "run" "stable" "rls")
           ;; rustic-lsp-server 'rust-analyzer
           ;; rustic-format-trigger 'on-save
           rust-format-on-save t)
     scala
     (shell :variables
            shell-default-shell 'vterm
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "/bin/zsh")
     shell-scripts
     semantic
     (spell-checking :variables
                     enable-flyspell-auto-completion t
                     spell-checking-enable-by-default t)
     (syntax-checking :variables syntax-checking-enable-by-default t)
     systemd
     treemacs
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-fmt-tool 'prettier
                 typescript-linter 'es-lint
                 typescript-backend 'lsp)
     vagrant
     (version-control :variables version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left
                      version-control-global-margin t)
     vimscript
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      all-the-icons
                                      company-lsp
                                      doom-modeline
                                      doom-themes
                                      fzf
                                      google-c-style
                                      go-playground
                                      helm-rg
                                      lsp-mode
                                      lsp-ui
                                      magit-todos
                                      rust-playground
                                      ;; rustic
                                      yasnippet-snippets
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    eclim
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         base16-onedark
                         base16-atelier-dune
                         gruvbox
                         )
   ;; dotspacemacs-mode-line-theme '(spacemacs :separator arrow :separator-scale 1.5)
   dotspacemacs-mode-line-theme '(doom :separator-scale 1.0)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("SauceCodePro Nerd Font"
                               :size 12.5
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-frame-title-format "%I@%S"
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.0
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers
   '(:relative t
               :disabled-for-modes dired-mode
               doc-view-mode
               markdown-mode
               org-mode
               )
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `trailing
   ))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
)


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you shouldplace your code here."
  ;; Next two lines are to correct https://github.com/syl20bnr/spacemacs/issues/3477
  ;; (set-face-attribute 'default nil :family "SauceCodePro Nerd Font")
  ;; (set-face-attribute 'default nil :height 120)
  (when (daemonp)
    (setq doom-modeline-icon t))
  (global-visual-line-mode t)
  (scroll-bar-mode -1)
  (tool-bar-mode   -1)
  (tooltip-mode    -1)
  (menu-bar-mode   -1)
  ;; (unless (daemonp) (server-mode 1))
  (add-hook 'prog-mode-hook 'column-enforce-mode)
  (setq column-enforce-column 100)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-always-indent t)
  ;; :q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)
  ;; Write and quit to operate as expected
  (defun ex-save-kill-buffer-and-close ()
    (interactive)
    (save-buffer)
    (kill-this-buffer)
    )
  (evil-ex-define-cmd "wq" 'ex-save-kill-buffer-and-close)
  (defun put-the-date ()
    (interactive)
    (insert (format-time-string " %Y-%m-%dT%k:%M:%S.%3NZ" (current-time) "utc")))
   (global-set-key(kbd "C-c C-d")'put-the-date)
  (setq-default show-trailing-whitespace t)
  (global-git-commit-mode t)
  (defun helm-do-grep ()
    (interactive)
    (helm-do-grep-1 (helm-read-file-name
                     "Search in file(s): "
                     :marked-candidates t)
                    (or current-prefix-arg helm-current-prefix-arg)))
  (setq yas-snippet-dirs
        '("~/.emacs.d/private/snippets"
          ))
  ;; Fix paste behavior to be inline with current expectations
  (defun evil-paste-after-from-0 ()
    (interactive)
    (let ((evil-this-register ?0))
      (call-interactively 'evil-paste-after)))

  (define-key evil-visual-state-map "p" 'evil-paste-after-from-0)
  ;; C/Cpp Configuration
  ;;
  (push '("C" "h") projectile-other-file-alist)
  ;; ACR: setup gdb nicely
  (setq gud-gdb-command-name "gdb --annotate=3")
  (setq gdb-many-windows t)

  ;; Dap Config
  ;;
  (defun rust/pre-init-dap-mode ()
    (add-to-list 'spacemacs--dap-supported-modes 'rust-mode))

  ;; Font Lock
  ;;
  (defun font-lock-show-tabs ()
    "Return a font-lock style keyword for tab characters."
    '(("\t" 0 'trailing-whitespace prepend)))

  (font-lock-add-keywords 'c++-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'c-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'python-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'java-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'go-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'sh-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'rust-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'ruby-mode (font-lock-show-tabs))
  (font-lock-add-keywords 'javascript-mode (font-lock-show-tabs))

  (add-hook 'c++-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'c-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'python-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'java-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'go-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'sh-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'rust-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'ruby-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)))

  (add-hook 'javascript-mode-hook
              (lambda ()
                (setq show-trailing-whitespace t)))
  ;; Jump history per: https://github.com/syl20bnr/spacemacs/issues/5847
  (defun my-evil-set-jump (&rest _)
    (evil-set-jump))
  (advice-add 'evil-previous-line :before 'my-evil-set-jump)
  (advice-add 'evil-next-line :before 'my-evil-set-jump)
  (setq evil-escape-key-sequence "jk")
  ;; (set-face-background hl-line-face "#234")
  (setq ns-pop-up-frames nil)
  (setq use-dialog-box nil)
  (setq dumb-jump-prefer-searcher 'rg)
  (setq vc-follow-symlinks t)
  (setq create-lockfiles nil)
  (evil-leader/set-key
    "q q" 'spacemacs/frame-killer)
  ;; Better handling for long paths or naming conventions in the path
  (setq doom-modeline-buffer-file-name-style 'truncate-except-project)
  ;; undo-tree should have timestamps
  (use-package undo-tree
    :diminish undo-tree-mode
    :config
    (progn
      (global-undo-tree-mode)
      (setq undo-tree-visualizer-timestamps t)
      (setq undo-tree-visualizer-diff t)))
  (with-eval-after-load 'org
    (setq-default org-directory "~/Documents/org/")
    (setq-default org-index-file (concat org-directory "index.org"))
    (setq-default org-default-notes-file (concat org-directory "notes.org"))
    (setq-default org-capture-templates
      '(("t" "Todo" entry (file+headline org-index-file "Tasks")
          "* TODO %?\nAdded: %U\n" :prepend t :kill-buffer t)
        ("m" "Meeting Notes" entry (file+headline "meeting_notes.org" "Meeting Notes")
          "* %?\nAdded: %U\n" :prepend t :kill-buffer t)
        ("i" "Idea" entry (file+headline org-default-notes-file "Ideas")
          "* IDEA %?\nAdded: %U\n" :prepend t :kill-buffer t)
        ("n" "Notes" entry (file+headline org-default-notes-file "Notes")
          "* %?\nAdded: %U\n" :prepend t :kill-buffer t)
        ))
    (setq-default org-bullets-bullet-list '("■" "◆" "▲" "▶"))
    (doom-themes-org-config)
    (setq-default
      org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "[ ](T)" "[-](p)" "[?](m)" "|" "[X](D)")
        (sequence "NEXT(n)" "IN PROGRESS(i)" "PLANNED(p)" "BLOCKED(b)"
                  "WAITING(w)" "LATER(l)" "|" "CANCELED(c)"))
      org-todo-keyword-faces
      '(("TODO" . "#dc752f")
        ("NEXT" . "#dc752f")
        ("WAITING" . "#2aa198")
        ("IN PROGRESS" . "#268bd2")
        ("BLOCKED" . "#d70000")
        ("CANCELED" . "#d70000")
        ("FAIL" . "#d70000")
        ("DONE" . "#86dc2f")
        ("NOTE" . "#875f00")
        ("LATER" . "#875f00")
        ("HACK" . "#875f00")
        ("TEMP" . "#875f00")
        ("FIXME" . "#dc752f")
        ("XXX+" . "#dc752f")
        ("\\?\\?\\?+" . "#dc752f")
        ("[-]" :inherit (font-lock-constant-face bold))
        ("[?]" :inherit (warning bold)))
    )
    (setq org-archive-mark-done nil)
    (setq org-archive-location "%s_archive::* Archived Tasks")
    (add-hook 'org-capture-mode-hook 'evil-insert-state)
    (use-package org-projectile
      :after projectile
      :config
      (setq org-projectile-projects-file
            "~/Documents/org/projects/proj_todos.org")
      (push (org-projectile-project-todo-entry) org-capture-templates)
      (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
      (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read))
    ;; Derive agenda from TODOs stored in index file
    (setq org-agenda-files (list org-index-file
                                org-projectile-projects-file))
  )
  (defun stop-using-minibuffer ()
    "kill the minibuffer"
    (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
      (abort-recursive-edit)))

  (add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
  (spacemacs/set-leader-keys "p*" 'helm-projectile-rg)
  ;; Rust Ctags Configuration
  (defun generate-rusty-tags ()
    (interactive)
    (shell-command "rusty-tags -O TAGS emacs"))
  (spacemacs/set-leader-keys-for-major-mode 'rust-mode "G" 'generate-rusty-tags)
  (setq exec-path (append exec-path '("~/.cargo/bin/")))
  ;; Bind <SPC f z> to fzf fuzzy find in CWD, and <SPC f Z> for a manual directory.
  ;; We disable colors so that the display looks good on any Emacs theme,
  ;; and we move the fzf prompt up by 1 row to fix a rendering bug in ansi-term.
  ;; Note that you simply press <C-c C-c> to gently exit fzf if you want to abort.
  (evil-leader/set-key "f z" 'fzf-directory)
  ;; CCLS Configuration
  (setq ccls-sem-highlight-method 'overlay)
)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (vagrant-tramp vagrant x86-lookup nasm-mode tide typescript-mode helm-rg company treemacs org-plus-contrib rustic vhdl-tools utop tuareg caml ocp-indent ob-elixir flycheck-ocaml merlin flycheck-mix flycheck-credo emojify emoji-cheat-sheet-plus dune company-emoji auto-complete-rst alchemist elixir-mode helm-core rust-mode evil async yasnippet-snippets lsp-ui lsp-python-ms live-py-mode helm lsp-mode yasnippet magit yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights vmd-mode vimrc-mode vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-magit treemacs-evil toml-mode toc-org tagedit systemd symon symbol-overlay string-inflection stickyfunc-enhance srefactor spaceline-all-the-icons smeargle slim-mode shell-pop seeing-is-believing scss-mode sass-mode rvm rust-playground ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe restart-emacs rbenv rainbow-delimiters racer python pytest pyenv-mode py-isort pug-mode projectile-rails prettier-js popwin pippel pipenv pip-requirements persp-mode password-generator paradox ox-jira ox-gfm overseer orgit org-projectile org-present org-pomodoro org-mime org-jira org-download org-cliplink org-bullets org-brain open-junk-file omnisharp noflet nodejs-repl nameless mvn multi-term move-text mmm-mode minitest meghanada maven-test-mode markdown-toc magit-todos magit-svn magit-gitflow macrostep lsp-treemacs lsp-java lorem-ipsum livid-mode link-hint json-navigator js2-refactor js-doc insert-shebang indent-guide importmagic impatient-mode hybrid-mode hungry-delete highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag gruvbox-theme groovy-mode groovy-imports gradle-mode google-translate google-c-style golden-ratio godoctor go-tag go-rename go-playground go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags fzf fuzzy forge font-lock+ flyspell-popup flyspell-correct-helm flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-package flycheck-golangci-lint flycheck-bashate flx-ido fish-mode fill-column-indicator feature-mode fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-commentary evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-themes doom-modeline dockerfile-mode docker disaster diminish diff-hl devdocs define-word dap-mode dactyl-mode cython-mode csv-mode cquery cpp-auto-include company-web company-tern company-statistics company-shell company-rtags company-lsp company-go company-c-headers company-anaconda column-enforce-mode clean-aindent-mode clang-format chruby centered-cursor-mode ccls cargo bundler browse-at-remote blacken base16-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
