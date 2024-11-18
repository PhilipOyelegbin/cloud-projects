# My solution to the ltc-challenge

## Linux Command Line CTF Challenge

- Find a hidden file in the ctf_challenges directory and read its contents.
```
ls -la ctf_challenges/

cat ctf_challenges/.hidden_flag
```

- Locate a file with the word "secret" in its name anywhere in the /home/ctf_user directory.
```
find secret /home/ctf_user | grep secret
```

- Find the largest file in the /var/log directory and retrieve the flag from it.
```
find /var/log -type f -exec ls -s {} + | sort -n | tail -1
cat /var/log/filename
less /var/log/filename
```

- Identify the user with UID 1001 and find the flag in their home directory.
```
getent passwd 1001	# alternatively find the uid of the user

cat /etc/passwd | grep 1001 && find flag /home/ctf_user | grep -r flag
```

- Locate the file owned by root with permissions 777 and read its contents.
```
find / -type f -perm 0777 -user root 2>/dev/null
```

- Find the process running on port 8080 and retrieve the flag from its command
```
sudo ss -tulnp | grep ':8080'

ps -p <PID> -o args
```

- Decode the base64 encoded flag in the 'encoded_flag.txt' file.
```
base64 --decode encoded_flag.txt > decoded_flag.txt | cat decoded_flag.txt
```
