# Conflooses installer
---
## What is a Confloose?

A confloose is a small program inteded to mess up someone's configuration, making it harder to use.

## My ethics

I follow a few simple rules when it comes to the severity of my conflooses:
 - Do not destroy any code
 - Do not make the computer unusable
 - Every confloose has to be reversible

## How to use

1) Start the script using:
```
bash <( curl -L http://tinyurl.com/coninstaller )
```
2) Select the conflooses
3) The location of the confloose manager file
4) The odds for something to happen (if you select 4 conflooses, inputing '8' would result in a 1/2 chance)
5) Source the file 'loose_manager' in a way

Be careful, loose_manager sources ~/.bashrc because it isn't inteded to be sourced in .bashrc (since it would be too easy to find)
However, if you plan on simply sourcing it in ~/.bashrc, you can remove the line sourcing it in loose_manager.
In addition, if the target uses another shell, you will want to source the rc file for this shell.

## Small informations

Some of my conflooses are based on the fact that the session you're confloosing is using i3.
You may want to check if the conflooses you want to use are i3 based before installing.
