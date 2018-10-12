$privdata = gc .\azs_windows_2016_datacenter_privdata.json | Out-String | ConvertFrom-Json

# Variables
$path = ".\output-hyperv-iso\Virtual Hard Disks\"
$destpath = "D:\dropbox\"
$strAccountKey = $privdata.strAccountKey
$strBlob = $privdata.strBlob
$vhd = get-ChildItem -path $path -File *.vhdx -Recurse

# Build azpkg
D:\AzureGalleryPackageGenerator\AzureGalleryPackager -m c .\mkpackager\Windows\manifest.json -o $destpath
convert-vhd -path $path\$vhd -DestinationPath ($destpath + $vhd.BaseName + ".vhd") -VHDType Fixed

# Upload files
& 'C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\AzCopy.exe' /Source:"$destpath" /Dest:"$strBlob" /DestKey:$strAccountKey /S
