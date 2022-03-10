
import subprocess 


def RunCommand( Cmd : str):
  print(Cmd)
  try:
    sproc = subprocess.Popen(Cmd, shell=True, stdin=subprocess.PIPE, \
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout_data, stderr_data = sproc.communicate(timeout=60)
    stdout_data = stdout_data.decode("utf-8", "ignore")
    stderr_data = stderr_data.decode("utf-8", "ignore")
    return stdout_data, stderr_data
  except OSError:
    return "", "OS Error running {}".format(Cmd)
  except subprocess.TimeoutExpired:
    return "", "Timout Error running {}".format(Cmd)



def SizeInBytes(Size):
  if Size < 8:
      return 1
  Numbytes = int(Size / 8)
  assert Numbytes * 8 == Size
  return Numbytes


