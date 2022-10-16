#!/ bin/bash

echo "hello"
# date
pwd # This is an inline comment
# ls

# here it is a heredoc and it's syntax
cat << EOF
Welcome to the Linux Lessons.
This lesson is about the shell scripting
EOF


#  If the HereDoc block is not redirected to a command, it can serve as a multiline comments placeholder.
<< multiline-comment
pwd
ls
Everything inside the
HereDoc body is
a multiline comment
multiline-comment

