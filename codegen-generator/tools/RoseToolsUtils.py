##############################################################
#
# Utility functions for tools for Rosette IR.
#
##############################################################


import subprocess
import os
import signal
import threading


def RunCommand(Cmd: str, Timeout=None):
    return RunCommandUsingPipes(Cmd, Timeout)


def RunCommandUsingPipes(Cmd: str, Timeout=None):
    print(Cmd)
    try:
        SubProcess = subprocess.Popen(Cmd, stdin=subprocess.PIPE, shell=True,
                                      stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if Timeout != None:
            Stdout, Stderr = SubProcess.communicate(timeout=Timeout)
        else:
            Stdout, Stderr = SubProcess.communicate()
        Stdout = Stdout.decode("utf-8", "ignore")
        Stderr = Stderr.decode("utf-8", "ignore")
        return Stdout, Stderr
    except OSError:
        print("OSERROR")
        return "", "OS Error running {}".format(Cmd)
    except subprocess.TimeoutExpired:
        print("TIMEOUT")
        return "", "Timout Error running {}".format(Cmd)


def SizeInBytes(Size):
    if Size < 8:
        return 1
    Numbytes = int(Size / 8)
    assert Numbytes * 8 == Size
    return Numbytes


# Header for automatically generated files
def GenHeadersForAutoGenFiles(CommentSyntax: str):
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
