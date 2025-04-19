#!/bin/bash
oldfile1= newfile1
oldfile2= newfile2
for in in $(!oldfile[@])
do
mv $oldfile1 $newfile1
mv $oldfile2 $newfile2
donne