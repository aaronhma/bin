# Plugins Folder Readme.

git folder include 3 different plugins

1. gbrt 								alias:  gbs (git branch status)

Show each Git branches status sorted by time, use for merging and maintainance

2. gitstatus.py

Use in [git-prompt](https://github.com/olivierverdier/zsh-git-prompt), it is currently include in zsh/config file. It used to pop up the branch status

3. git_cwd.info

it is used for showing the current branch and its current commit

4. [git-wtf](http://git-wt-commit.rubyforge.org/)  alias:  gbst

it is to display the state of your repository in a readable and easy-to-scan format.
git-wtf tries to ease the task of having many git branches. It's also useful for getting a summary of how tracking branches relate to a remote server.

git-wtf shows you:

    How your branch relates to the remote repo, if it's a tracking branch.
    How your branch relates to non-feature ("version") branches, if it's a feature branch.
    How your branch relates to the feature branches, if it's a version branch.

For each of these relationships, git-wtf displays the commits pending on either side, if any. It displays checkboxes along the side for easy scanning of merged/non-merged branches.

If you're working against a remote repo, git-wtf is best used between a 'git fetch' and a 'git merge' (or 'git pull' if you don't mind the redundant network access).


5. [git-publish-branch](http://git-wt-commit.rubyforge.org/)   alias:  gbpb

git-publish-branch is a simple script to ease the unnecessarily complex task of "publishing" a branch, i.e., taking a local branch, creating a reference to it on a remote repo, and setting up the local branch to track the remote one, all in one go.

You give it a branch name, and that branch is published in your remote repository. That's it. If you use -d, it will delete the remote reference.

Useful if you publish your topic branches to the outside world.


6. [git-rank-contributors](http://git-wt-commit.rubyforge.org/)   alias:  ggcc

git-rank-contributors is a trivial script that paws through your logs and ranks all the contributors by the size of their diffs. As always, bigger is better!

If you use -v, you'll get the raw diff sizes.

If you use -o, you'll get high-tech email obfuscation.

Output with just -o may be suitable for piping into a CREDITS file. It probably will require some editing in case people submit from more than one email address, though.

This is similar to git shortlog -s -n --no-merges, but counts diff size rather than number of commits.

7. [git-show-merges ](http://git-wt-commit.rubyforge.org/)   alias:  ggsm

git-show-merges is a precursor to git-wtf. It's a simple tool that shows you which branches have been merged in to the current branch, and which haven't. That's it. You can also specify multiple non-topic branches (merge branches?) on the commandline.


Git-Scripts

1. git-addremove

add untracked file on Staging, remove deleted files
add/remove all changes from the index, similar to hg addremove



3. git-all-commits

show all commits hash on the screen, one line per hash
Note: no usage, no alias

4. git-all.rb

Did not work, the require statement, could not find git and main
