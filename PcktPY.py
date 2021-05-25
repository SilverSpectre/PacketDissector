from tkinter import *
import subprocess

root = Tk()
filename = Entry()
target = Entry()
ip = Entry()

def GetPackets():
    options = "name=" + filename.get() + "\ntarget=" + target.get() + "\nip=" + ip.get()
    Add(options)
    Label(root, text="Getting Packets...").pack()
    subprocess.call(["C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe", '-Command', '&{. "./PcktPS.ps1"; & GetPackets}'])
    DisplayInfo()

def DisplayInfo():
    Label(root, text="Saving log to " + filename.get() + ".evtx...").pack()
    Label(root, text="Opening " + filename.get() + ".evtx...").pack()
    subprocess.call(["C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe", '-Command', '&{. "./PcktPS.ps1"; & DisplayInfo}'])

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
    Button(root, text="Get Packets", padx="10", pady="10", command=GetPackets).pack()
    root.mainloop()

Package()