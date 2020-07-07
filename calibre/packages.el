;;; packages.el --- calibre layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Linbin Chen <linbin.c@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `calibre-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `calibre/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `calibre/pre-init-PACKAGE' and/or
;;   `calibre/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst calibre-packages
  '(calibredb)
  "The list of Lisp packages required by the calibre layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun calibre/init-calibredb ()
     (use-package calibredb
      :init (progn
              (spacemacs/set-leader-keys "atc" 'calibredb)
              (spacemacs/declare-prefix-for-mode 'calibredb-show-mode "mm" "metadata" )
              (spacemacs/set-leader-keys-for-major-mode 'calibredb-show-mode
                "?" 'calibredb-entry-dispatch
                "o" 'calibredb-find-file
                "O" 'calibredb-find-file-other-frame
                "V" 'calibredb-open-file-with-default-tool
                "e" 'calibredb-export-dispatch
                "q" 'calibredb-entry-quit
                "." 'calibredb-open-dired
                "mt" 'calibredb-set-metadata--tags
                "ma" 'calibredb-set-metadata--author_sort
                "mA" 'calibredb-set-metadata--authors
                "mT" 'calibredb-set-metadata--title
                "mc" 'calibredb-set-metadata--comments)
              (spacemacs/declare-prefix-for-mode 'calibredb-search-mode "mm" "metadata")
              (spacemacs/declare-prefix-for-mode 'calibredb-search-mode "mt" "toggle")
              (spacemacs/declare-prefix-for-mode 'calibredb-search-mode "ml" "library")
              (spacemacs/declare-prefix-for-mode 'calibredb-search-mode "ms" "select")
              (spacemacs/set-leader-keys-for-major-mode 'calibredb-search-mode
                "?" 'calibredb-dispatch
                "a" 'calibredb-add
                "A" 'calibredb-add-dir
                "b" 'calibredb-catalog-bib-dispatch
                "c" 'calibredb-clone
                "d" 'calibredb-remove
                "e" 'calibredb-export-dispatch
                "f" 'calibredb-search-live-filter
                "tf" 'calibredb-toggle-favorite-at-point
                "tx" 'calibredb-toggle-archive-at-point
                "th" 'calibredb-toggle-highlight-at-point
                "tv" 'calibredb-toggle-view-at-point
                "tV" 'calibredb-toggle-view
                "ll" 'calibredb-library-list
                "ln" 'calibredb-library-next
                "lp" 'calibredb-library-previous
                "ls" 'calibredb-switch-library
                "n" 'calibredb-show-next-entry
                "p" 'calibredb-show-previous-entry
                "r" 'calibredb-search-refresh-and-clear-filter
                "R" 'calibredb-search-refresh-or-resume
                "sm" 'calibredb-unmark-at-point
                "sf" 'calibredb-mark-and-forward
                "su" 'calibredb-unmark-and-forward
                "sb" 'calibredb-unmark-and-backward
                "i" 'calibredb-edit-annotation
                "o" 'calibredb-find-file
                "O" 'calibredb-find-file-other-frame
                "v" 'calibredb-view
                "V" 'calibredb-open-file-with-default-tool
                "q" 'calibredb-search-quit
                "." 'calibredb-open-dired
                "mt" 'calibredb-set-metadata--tags
                "ma" 'calibredb-set-metadata--author_sort
                "mA" 'calibredb-set-metadata--authors
                "mT" 'calibredb-set-metadata--title
                "mc" 'calibredb-set-metadata--comments)
              )
      :config
      (progn
        (setq calibredb-size-show t)
        (setq calibredb-comment-width 0)
        (setq calibredb-id-width 0)
        (setq calibredb-tag-width 0)
        )
      )
    )

;;; packages.el ends here
