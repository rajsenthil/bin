;;; setup-go.el
;;; this file is created by following the youtube video for setup golang in emacs

(use-package go-mode
  :mode "\\.go$"
  :interpreter "go"
  :config
  (setq gofmt-command "goimports")
  (if (not (executable-find "goimports"))
      (warn "go-mode: couldn't find goimports; no code formatting/fixed imports on save")
    (add-hook 'before-save-hook 'gofmt-before-save))
  (if (not (string-match "go" compile-command)) ; set compile command default
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet")))

(use-package go-guru
  :commands (go-guru-describe go-guru-freevars go-guru-implements go-guru-peers
 	     go-guru-referrers go-guru-defintion go-guru-pointsto
	     go-guru-callstack go-guru-whichers go-guru-callers go-guru-callees
	     go-guru-expand-region)
  :config
  (unless (executable-find "guru")
    (warn "go-mode: couldn't find guru, refactoring commands won't work"))
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
  (defhydra hydra-go-guru (:color pink :columns 2 :hint nil)
    "
^NAME^        ^TYPE^        ^CALL^        ^ALIAS^
_._: definition _d_: describe _lr_: callers _p_: pointsto
_r_: referrers _i_: implement _le_: callees _c_: peers
_f_: freevars ^ ^ _s_: callstack _e_: whichers"
    ("." go-guru-defintion)
    ("r" go-guru-referrers)
    ("f" go-guru-freevars)
    ("d" go-guru-describe)
    ("i" go-guru-implements)
    ("lr" go-guru-callers)
    ("le" go-guru-callees)
    ("s" go-guru-callstack)
    ("p" go-guru-pointsto)
    ("c" go-guru-peers)
    ("e" go-guru-whichers)
    ("S" go-guru-set-scope "scope" :color blue)))

(use-package go-eldoc
  :defer 2
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package company-go
  :defer 2
  :config
  (setq company-go-show-annotation t)
  (add-hook 'go-mode-hook
    (lambda ()
      (set (make-local-variable 'company-backends) '(company-go))
      (company-mode))))

(use-package gotest
  :defer 2
  :after go-mode
  :bind (:map go-mode-map
	      ("C-c t m" . go-test-current-file)
	      ("C-c t ." . go-test-current-test)
	      ("C-c t c" . go-test-current-coverage)
	      ("C-c t b" . go-test-current-benchmark)))

(use-package flycheck-golangci-lint
  :hook (go-mode . flycheck-golangci-lint-setup)
  :config (setq flycheck-golangci-lint-tests t))

(use-package godoctor
  :defer 2
  :after go-mode)

(provide 'setup-go)





	     

	       
