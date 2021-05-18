from tkinter import *
import subprocess

root = Tk()
filename = Entry()
target = Entry()
ip = Entry()

def Script():
    options = "name=" + filename.get() + "\ntarget=" + target.get() + "\nip=" + ip.get()
    Add(options)
    Label(root, text="Getting Packets...").pack()
    subprocess.Popen('powershell', shell=True)
    subprocess.run('.\PcktPS.ps1', shell=True)
    subprocess.Popen('exit', shell=True)

def Add(content):
    data = open("options.txt", "w+")
    data.write(content)
    data.close()

def Package():
    Label(root, text="Packet Dissector v.2\nBy Gavin Weber", padx="50").pack()
    Label(root, text="Filename").pack()
    filename.pack()
    Label(root, text="Computer Name").pack()
    target.pack()
    Label(root, text="IP Address").pack()
    ip.pack()
    Button(root, text="Get Packets", padx="10",
           pady="10", command=Script).pack()
    root.mainloop()

def Import():
    # importing and returning etl file.
    print("Currently not displaying data")

Package()
Import()