Packer-AzureStack
================
 ***packer.io templates &amp; scripts for building private cloud optimized Windows OS images.***
If your unclear what packer templates are about check http://packer.io

This template is intended for marketplace automation. You can use templates as is, or intergrate it with a continous delivery model using Jenkins.

### Prereqs

* You will need to create an ISO folder, and add in your ISO for your OS
* You will need to install Packer
* You will need to install AzCopy 

### Private data
In this example the only private data is the password used for local administrator and "localuser" user account. Copy the Example-privatedate.json to privatedata.json in the root of the directory. Add your own password here and the file will be ignored by git. Follow this practice for any other data you do not want in your repo.  

### Building the images
After configuring your build system with the required bits and prerequsits use the following commands to build the images. From the root of the git repo run the follwing commands. 

Quick validation of file paths...
<pre><code>packer validate -var-file=azs_windows_2016_datacenter_privdata.json azs_windows_2016_datacenter.json</pre></code>

Build OS images
<pre><code>packer build -force -var-file=azs_windows_2016_datacenter_privdata.json azs_windows_2016_datacenter.json</pre></code>

*** Sample a Privdata JSON ***
<pre><code>{
    "username": "Administrator",
    "password": "(password)",
    "strAccountKey": "<Storage Key>",
    "strBlob": "<blob endpoint>"
}</pre></code>

### Credit
Joel Fitzgerald - A inital work and ideas came from his repo'
https://github.com/joefitzgerald/packer-windows


