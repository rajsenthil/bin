#! /usr/bin/env python
import os
import sys
import subprocess

def splitter( fullpath ):
    try:
        dirname, filename = fullpath.rsplit('/',1)  # split at the rightmost `/`
#         print("dirname:",dirname,", filename",filename)
        file_prefix, file_suffix = filename.split('.',1)
#         print("file_prefix:",file_prefix,"file_suffix:",file_suffix)
        return dirname, int(file_prefix), file_suffix
    except ValueError: # no _ in there
        return fullpath, None, None

folder_path=input("prompt")

print("input::",folder_path)
#folder_path = '/home/tst-hrajamoney/Sphinx/scripts/test'
#for root, dirnames, files in os.walk(folder_path, True, None, False):
file_list=[]
for root, dirnames, files in os.walk(folder_path):
#   print("Inside for loop1")
  for dirname in dirnames:
#     print("Inside for loop2")
    dirpath = os.path.join(root, dirname)
    for root1, dirnames1, filenames in os.walk(dirpath):
#         print("Inside for loop3")
#         print ("Walking Dir :",dirpath);
        for filename in filenames:
#             print("Inside for loop4")
            if filename.endswith('mp4'):
                filepath = os.path.join(root1, filename)                
#                 print ("MP4: ",filepath)
                file_list.append(filepath)
        filestr=""
#         file_list = sorted(file_list, key = lambda x: string(x.split(".")[0]))
        file_list = sorted(file_list, key=splitter)
        for file1 in file_list:
          filestr=filestr+f'"{file1}"'+" "
#         print("file::",filestr)

        dir_prefix, dir_suffix = dirpath.rsplit("/",1)
        print("vlc", filestr+" --sout '#gather:std{access=file,dst=\"/home/senthil/tmp/"+dir_suffix+".mp4\"}' --sout-keep")
#         subprocess.call(["vlc", filestr+" --sout '#gather:std{access=file,dst=final_file.mp4}' --sout-keep"], shell=True)


#         /home/senthil/Desktop/Windows-Books/javascript/angular/Angular 8 formerly Angular 2 - The Complete Guide
#         ffmpeg -i concat:"input1.mp4|input2.mp4" output.mp4
#         print("ffmpeg", "-i", "concat:"+filestr+" output.mp4")
#         subprocess.call(["ffmpeg", "-i", "concat:"+filestr+" output.mp4"])
        file_list=[]
#         sys.exit()

