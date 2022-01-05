# Bash Utils

This is a list of files and scripts that would be nice to have on any POSIX installation.

## WSL Notes

If you're using oh-my-zsh, follow this post: https://www.reddit.com/r/bashonubuntuonwindows/comments/hilev2/found_a_possible_solution_for_zsh_being_very_slow/
Basically, omz can get slow due to having to search through all the native windows paths. The workaround is to remove them as follows: 

> Found that the culprit was the list of path variables automatically imported by windows. I disabled automatic path import by creating a new /etc/wsl.conf file with content

```
[automount]
enabled = true

[interop]
appendWindowsPath = false
```

