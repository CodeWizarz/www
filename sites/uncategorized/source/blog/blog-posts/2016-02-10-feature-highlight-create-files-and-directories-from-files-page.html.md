---
title: "Feature Highlight: Create files and directories from the Files page"
description: "In this feature highlight we look at how you can create a new file, directory, branch or tag from the file browser."
canonical_path: "/blog/2016/02/10/feature-highlight-create-files-and-directories-from-files-page/"
date: 2016-02-10
author: Drew Blessing
author_twitter: drewblessing
categories: engineering
---

Sometimes it's easier to make quick changes directly from the GitLab interface
than to clone the project and use the Git command line tool. In this feature
highlight we look at how you can create a new file, directory, branch or
tag from the file browser. All of these actions are available from a single
dropdown menu.

<!-- more -->

## Create a file

From a project's files page, click the '+' button to the right of the branch selector.
Choose 'New file' from the dropdown.

![New file dropdown menu](/images/create_files/new_file_dropdown.png)

Enter a file name in the 'File name' box. Then, add file content in the editor
area. Add a descriptive commit message and choose a branch. The branch field
will default to the branch you were viewing in the file browser. If you enter
a new branch name, a checkbox will appear allowing you to start a new merge
request after you commit the changes.

When you are satisfied with your new file, click 'Commit Changes' at the bottom.

![Create file editor](/images/create_files/new_file_editor.png)

## Upload a file

The ability to create a file is great when the content is text. However, this
doesn't work well for binary data such as images, PDFs or other file types. In
this case you need to upload a file.

From a project's files page, click the '+' button to the right of the branch
selector. Choose 'Upload file' from the dropdown.

![Upload file dropdown menu](/images/create_files/upload_file_dropdown.png)

Once the upload dialog pops up there are two ways to upload your file. Either
drag and drop a file on the pop up or use the 'click to upload' link. A file
preview will appear once you have selected a file to upload.

Enter a commit message, choose a branch, and click 'Upload file' when you are
ready.

![Upload file dialog](/images/create_files/upload_file_dialog.png)

## Create a directory

To keep files in the repository organized it is often helpful to create a new
directory.

From a project's files page, click the '+' button to the right of the branch selector.
Choose 'New directory' from the dropdown.

![New directory dropdown](/images/create_files/new_directory_dropdown.png)

In the new directory dialog enter a directory name, a commit message and choose
the target branch. Click 'Create directory' to finish.

![New directory dialog](/images/create_files/new_directory_dialog.png)

## Tip

When creating or uploading a new file, or creating a new directory, you can
trigger a new merge request rather than committing directly to master. Enter
a new branch name in the 'Target branch' field. You will notice a checkbox
appear that is labeled 'Start a new merge request with these changes'. After
you commit the changes you will be taken to a new merge request form.

![Start a new merge request with these changes](/images/create_files/start_new_merge_request.png)

## Create a new branch

If you want to make changes to several files before creating a new merge
request, you can create a new branch up front. From a project's files page,
choose 'New branch' from the dropdown.

![New branch dropdown](/images/create_files/new_branch_dropdown.png)

Enter a new 'Branch name'. Optionally, change the 'Create from' field
to choose which branch, tag or commit SHA this new branch will originate from.
This field will autocomplete if you start typing an existing branch or tag.
Click 'Create branch' and you will be returned to the file browser on this new
branch.

![New branch page](/images/create_files/new_branch_page.png)

You can now make changes to any files, as needed. When you're ready to merge
the changes back to master you can use the widget at the top of the screen.
This widget only appears for a period of time after you create the branch or
modify files.

![New push widget](/images/create_files/new_push_widget.png)

## Create a new tag

Tags are useful for marking major milestones such as production releases,
release candidates, and more. You can create a tag from a branch or a commit
SHA. From a project's files page, choose 'New tag' from the dropdown.

![New tag dropdown](/images/create_files/new_tag_dropdown.png)

Give the tag a name such as `v1.0.0`. Choose the branch or SHA from which you
would like to create this new tag. You can optionally add a message and
release notes. The release notes section supports markdown format and you can
also upload an attachment. Click 'Create tag' and you will be taken to the tag
list page.

![New tag page](/images/create_files/new_tag_page.png)
