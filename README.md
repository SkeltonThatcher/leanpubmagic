LeanPub Magic
=============

**Helper scripts for publishing via LeanPub using DropBox *and* a non-Github Git repo.**

Purpose
-------
LeanPub (https://leanpub.com/) is an excellent lean publishing platform with useful APIs. LeanPub has integration with both Github and Dropbox for storing book content.

However, if you want to use a non-Github Git repo (for all the nice `git log` goodness), but still want the simplicity of Dropbox integration for generating previews and for publishing, then **LeanPub Magic** is for you. 

Details
-------

On the *Settings > Writing* page of your LeanPub book, for the *How do you want to write?* option choose "In a Dropbox folder on my computer":

![Screenshot of LeanPub writing settings](docs/LeanPub-Writing-settings.png "Dropbox option chosen")

- `LeanCopy`: copies files from the local Git repo to the local LeanPub Dropbox directory
- `LeanPreview`: triggers a book preview generation (async)
- `LeanStatus`: checks the progress (status) of a preview operation 

On Linux/Mac the scripts are `*.sh` and on Windows the scripts are `*.cmd`. The scripts behave identically on both platforms.

Setup
-----

There are four environment variables that you need to set before the LeanPub Magic scripts will work:

  1. LEANPUB\_BOOK\_NAME - the name of the LeanPub book as used in the LeanPub URL: e.g. for [https://leanpub.com/mybook](https://leanpub.com/mybook), the name is 'mybook'
  1. LEANPUB\_GIT\_DIR - the path to the directory within the local Git repo that contains the LeanPub 'manuscript' directory
  1. DROPBOX\_DIR - the path to the local Dropbox directory for the LeanPub book
  1. LEANPUB\_API\_KEY - your LeanPub API key
  
Of these, LEANPUB\_API\_KEY is likely to remain constant across multiple books, whereas the other variables will likely change for different books, allowing you to author more than one book using the same LeanPub Magic scripts.

During script execution, these variables are checked for sane values; the scripts exit if the variables are not set.

Workflow
--------

The combination of Git for version control and Dropbox for publishing control is powerful, especially for multi-author books. The general suggested workflow is:

  1. Use Git to make changes to the book content. Iterate here until you are ready to generate a preview (LeanPub knows nothing of our Git repo, which means that no intermediate previews are generated).
  1. When you are ready to generate a preview, run the *LeanCopy* script to copy the files from Git to the local Dropbox directory. This triggers an upload to the shared LeanPub Dropbox.
  1. When the Dropbox upload has completed, run the *LeanPreview* script, which triggers a preview generation; the `curl` call returns immediately.
  1. If required, run the *LeanStatus* script repeatedly in order to track the progress (status) of the preview generation. When the preview generation has completed, *LeanStatus* returns an empty JSON object.

Note: a script to automatically trigger a *Publish* of the book has not been included here, as a publish operation is probably best left as a manual thing via the browser.  

Pre-requisites
--------------

- The scripts use `curl` to talk to the LeanPub API. On Windows, you probably have `curl` through your Git tools, but if not, simply install Git bash from [http://git-scm.com/download/win](http://git-scm.com/download/win) - `curl` comes with Git bash.
- You will also need a Dropbox client installed locally, and a Dropbox account wired up to LeanPub (see [https://leanpub.com/help/getting_started_sync_dropbox](https://leanpub.com/help/getting_started_sync_dropbox) for details).

TODO
----

  1. Actually check the env vars before running the scripts.
  1. Document a worked example