(module "crypto.lsp")
(define (get_random_name)
	(crypto:sha256 (string (date-value) (rand 90009890) ) )
)
(setq mail_dir "")
(setq pre_set (find "-a" (main-args)))
(if (not (nil? pre_set))
	(setq mail_dir (main-args (+ pre_set 1)))
	(setq mail_dir (string (env "HOME") "/Mail"))
)
(println mail_dir)

(if (or (nil? mail_dir) (= mail_dir ""))
	(setq mail_dir (string (env "HOME") "/Mail"))
)


(if-not (directory? mail_dir) (exit -1))

(case ostype
	("OSX" (setq mail_tmp_file (exec (string "mktemp  /tmp/mail." (get_random_name))) )
	
	)
	;;Linux
	;;Windows
)

(println (nth 0 mail_tmp_file))
(set 'out-file (open (nth 0  mail_tmp_file) "write"))

(while (read-line 0)
        (write-line out-file))   
(close out-file)

(! (string "cp " (nth 0 mail_tmp_file) " " mail_dir))

;;; 第一步,取得了email 的文件


(exit 0)

