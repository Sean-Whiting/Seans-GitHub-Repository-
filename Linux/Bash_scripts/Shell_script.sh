sed s/INCORRECT_PASSWOR/ACCESS_DENIED/ LogA.txt > access_denied.txt
awk '{print $4, $6}' access_denied > filtered_logs.txt
