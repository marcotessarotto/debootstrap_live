#!/bin/sh
KERNEL_SOURCE_URL=https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.186.tar.xz



# Grab everything after the '=' character.
DOWNLOAD_URL=$(echo $KERNEL_SOURCE_URL| cut -f2 -d'=')


# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

cd source

# Downloading kernel file.
# -c option allows the download to resume.
wget -c $DOWNLOAD_URL

# Delete folder with previously extracted kernel.
echo "Deleting old kernel folder ..."
rm -rf ../work/kernel
mkdir ../work/kernel

# Extract kernel to folder 'work/kernel'.
# Full path will be something like 'work/kernel/linux-4.4.6'.
tar -xvf $ARCHIVE_FILE -C ../work/kernel

cd ..

