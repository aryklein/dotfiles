# dotfiles

In this repository I track my personal configuration files for my essential programs that I use in my Arch Linux setup.

For more information on how to store dotfiles:
https://www.atlassian.com/git/tutorials/dotfiles

## How to start tracking your dotfiles

Execute these commands:

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.zshrc
git init --bare $HOME/.dotfiles
```

After executed this setup any file within the $HOME folder can be versioned with normal commands,
replacing `git` with your `dotfile` alias, like:

```
dotfiles add .zshrc
dotfiles commit -m "Add .zshrc file"
dotfile push origin master
```

## How to install your dotfiles onto a new system

In the new system execute these lines:

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
```

Create a `.gitignore` file in your `$HOME` to avoid weird recursion:

```
echo ".dotfiles" >> .gitignore
```

Clone your dotfiles into a bare repository:

```
git clone --bare [git-repo-url] $HOME/.dotfiles
```

Checkout the content of your bare repository to your `$HOME`:

```
dotfiles checkout
```

If the step above failed because your $HOME folder might already have some stock configuration files,
you can remove them with the following command:

```
dotfiles checkout 2>&1 | egrep "\s+\.|README.md" | awk {'print $1'} | xargs rm -v
```

And re-run the checkout command:

```
dotfiles checkout
```

## How to uncommit the last commit (it's git bare repository)?

Taking into consideration that there are several git commands that make no sense in a bare repository
(because bare repositories don't use indexes and do not have a working directory) `git reset --hard HEAD^`
is not a solution to uncommit the last change in this repository.

To revert a change, you should clone the repository in your laptop:

```
git clone --bare [git-repo-url] $HOME/.dotfiles
```

And then:

```
dotfiles update-ref HEAD HEAD^
```

And finally push it to the origin:

```
dotfiles push origin master --force
```

