from tkinter import *
import subprocess
import time

root = Tk()
filename = Entry()
ip = Entry()

def Script():
    confirm = Label(root, text="Getting Packets...")
    confirm.pack()
    subprocess.Popen(".\\PcktPS.ps1 -name " + filename.get() + " -ip " + ip.get(), shell=True)
    # import data
    
def Pack():
    title.pack()
    fil.pack()
    filename.pack()
    IP.pack()
    ip.pack()
    getPacket.pack()
    root.mainloop()

title = Label(root, text="Packet Dissector v.1\nBy Gavin Weber", padx="50")
fil = Label(root, text="Filename")
IP = Label(root, text="IP")
getPacket = Button(root, text="Get Packet", padx="10", pady="10", command=Script)
Pack()