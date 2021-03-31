;; macros
(defmacro add-hook! (mode body)
  `(add-hook (intern
              (concat
                      (symbol-name 'mode)
                      "-hook"))
             ,body))

(defmacro enable-mode! (mode)
  (let ((name (intern (concat (symbol-name mode)
                              "-mode"))))
    `(,name t)))

(defmacro disable! (var)
  `(setq ,var nil))

(defmacro disable-mode! (mode)
  (let ((name (intern (concat (symbol-name mode)
                              "-mode"))))
    `(,name -1)))
