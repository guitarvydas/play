"https://api.kinopio.club/space/dmkVzKfTh5P29JR2_epyj"
curl "https://api.kinopio.club/space/dmkVzKfTh5P29JR2_epyj"
(system:run-shell-command "curl \"https://api.kinopio.club/space/dmkVzKfTh5P29JR2_epyj\"" :output :stream)
(sys:call-system-showing-output "curl \"https://api.kinopio.club/space/dmkVzKfTh5P29JR2_epyj\"")
(with-output-to-string (xx)
  (sys:call-system-showing-output "curl \"https://api.kinopio.club/space/dmkVzKfTh5P29JR2_epyj\"" :output-stream xx)
  (setf *xx* xx)
  "done")
