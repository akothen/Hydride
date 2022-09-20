##############################################################
#
# Utility functions for tools for Rosette IR.
#
##############################################################


import subprocess
import os
import signal
import threading


def RunCommand(Cmd : str):
  print(Cmd)
  try:
    #SubProcess = subprocess.Popen(Cmd, stdin=subprocess.PIPE, \
    #                        stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    #Stdout, Stderr = SubProcess.communicate(timeout=10)
    #Stdout = Stdout.decode("utf-8", "ignore")
    #Stderr = Stderr.decode("utf-8", "ignore")
    #return Stdout, Stderr
    CmdInList = Cmd.split(" ")
    print("CmdInList:")
    print(CmdInList)
    result = subprocess.run(CmdInList, capture_output=True, text=True, check=True, timeout=10)
    print("result:")
    print(result)
    Stdout = result.stdout
    Stderr = result.stderr
    print("Stdout:")
    print(Stdout)
    print("Stderr:")
    print(Stderr)
    return Stdout, Stderr
  except OSError:
    print("OSERROR")
    return "", "OS Error running {}".format(Cmd)
  except subprocess.TimeoutExpired:
    print("TIMEOUT")
    return "", "Timout Error running {}".format(Cmd)


def RunCommandUsingPipes(Cmd : str):
  print(Cmd)
  try:
    SubProcess = subprocess.Popen(Cmd, stdin=subprocess.PIPE, shell=False, \
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    Stdout, Stderr = SubProcess.communicate(timeout=10)
    Stdout = Stdout.decode("utf-8", "ignore")
    Stderr = Stderr.decode("utf-8", "ignore")
    os.killpg(os.getpgid(SubProcess.pid), signal.SIGTERM)  
    return Stdout, Stderr
  except OSError:
    print("OSERROR")
    return "", "OS Error running {}".format(Cmd)
  except subprocess.TimeoutExpired:
    print("TIMEOUT")
    return "", "Timout Error running {}".format(Cmd)


class CommandThread(threading.Thread):
    def __init__(self, Cmd):
        self.Stdout = None
        self.Stderr = None
        self.Cmd = Cmd
        threading.Thread.__init__(self)

    def run(self):
      try:
        print(self.Cmd)
        SubProcess = subprocess.Popen(self.Cmd.split(), shell=False, \
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print("---SubProcess {}: {}".format(self.Cmd, str(SubProcess)))
        Stdout, Stderr = SubProcess.communicate(timeout=10)
        print("+++SubProcess {}: {}, self.Stdout: {}, self.Stderr: {}".format(self.Cmd, \
                              str(SubProcess), str(Stdout), str(Stderr)))
        self.Stdout = Stdout.decode("utf-8", "ignore")
        self.Stderr = Stderr.decode("utf-8", "ignore")
        print("***SubProcess {}: {}, self.Stdout: {}, self.Stderr: {}".format(self.Cmd, \
                      str(SubProcess), str(self.Stdout), str(self.Stderr)))
        #SubProcess.terminate()
        #SubProcess.kill()
        #s.killpg(os.getpgid(SubProcess.pid), signal.SIGKILL)
        print("SUCCESS! {}".format(self.Cmd))
      except OSError:
        print("OSERROR")
        self.Stdout = ""
        self.Stderr = "OS Error running {}".format(self.Cmd)
      except subprocess.TimeoutExpired:
        print("TIMEOUT")
        self.Stdout = ""
        self.Stderr = "Timout Error running {}".format(self.Cmd)


def SizeInBytes(Size):
  if Size < 8:
      return 1
  Numbytes = int(Size / 8)
  assert Numbytes * 8 == Size
  return Numbytes


# Header for automatically generated files
def GenHeadersForAutoGenFiles(CommentSyntax : str):
  Header = CommentSyntax + "============================== Hydride File =================================\n" \
         + CommentSyntax + "\n" \
         + CommentSyntax + " Part of the Hydride Compiler Infrastructure. \n" \
         + CommentSyntax + " <Placeholder for license information> \n" \
         + CommentSyntax + "\n" \
         + CommentSyntax + "=============================================================================\n" \
         + CommentSyntax + "\n" \
         + CommentSyntax + " Do NOT modify this file. It is automatically generated. \n" \
         + CommentSyntax + "\n" \
         + CommentSyntax + "=============================================================================\n\n\n"
  return Header

