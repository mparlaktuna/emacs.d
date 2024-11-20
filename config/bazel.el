;; (defun compile-run-perception-repl ()
;;   "Clean resolved file and call bazel sync"
;;   (interactive)
;;   (compile "bazel run --config=host --config=trace @perception_framework//:perception_repl -- repl --listen -l perception.scm "))

(defun bazel-hedron ()
  (interactive)
  (message "Running bazel rtags connection")
  (let ((default-directory (projectile-project-root)))
    (compile "bazel run @hedron_compile_commands//:refresh_all -- --config=x86_64")
    (rtags-call-rc :path (projectile-project-root)
                   :silent t
                   "-J .")))

(defun open-cppcheck (buffer desc)
  (find-file "bazel-out/cppcheck.xml")
  (remove-hook 'compilation-finish-functions 'open-cppcheck))

(defun bazel-cppcheck ()
  (interactive)
  (message "Running bazel cppcheck")
  (add-hook 'compilation-finish-functions 'open-cppcheck)
  (let ((default-directory (projectile-project-root)))
    (compile "bazel run --config=x86_64 @ard_bazel_tools//:cppcheck")))

(defun bazel-sync (bool)
  (interactive
    (list (y-or-n-p "Remove resolved.bzl?")))
  (if bool
      (let ((f-name (concat (vc-root-dir) "resolved.bzl")))
	(delete-file f-name)
	(make-empty-file f-name)
	(write-region "resolved=[]" nil f-name)))
  (compile "bazel sync")
  )

(global-set-key [f5] 'recompile)

(defun bazel-build (target)
  "Build a Bazel TARGET."
  (interactive (list (bazel--read-target-pattern "build" nil)))
  (cl-check-type target string)
  (bazel--run-bazel-command "build --config=x86_64" target)
  nil)

(defun bazel-test-uint ()
  (interactive)
  (compile "bazel test  --config=x86_64 unit_tests")
  )


(use-package bazel
  :config
  (define-key bazel-mode-map (kbd "C-c C-s") #'bazel-sync)
  (define-key bazel-mode-map (kbd "C-c C-h") #'bazel-hedron))


