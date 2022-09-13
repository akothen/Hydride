import subprocess as sb
import os
import glob
from shutil import which

def dep_exists(name):
    return which(name) is not None

def execute(cmd, cwd=None):
    print(cmd)
    sb.call(cmd, cwd=cwd, shell=True)


def build_halide(hydride_root):

    halide_root = os.path.join(hydride_root, "halide-hydride")

    install_halide = ["bash", "install.sh"]
    install_halide_cmd = " ".join(install_halide)

    execute(install_halide_cmd, cwd=halide_root)

    print("*" * 5, "Successfully built halide repository", "*" * 5)


def install_custom_rosette(hydride_root):
    print("Installing rosette package....")
    rosette_src = llvm_src = os.path.join(hydride_root, "rosette")
    if dep_exists('raco'):
        install_cmd = [
            "raco",
            "pkg install",
            rosette_src,
        ]
        install_cmd = " ".join(install_cmd)

        execute(install_cmd)
    else:
        print("Please install Racket and the raco pkg manager")


def install_hydride_rkt(hydride_root):
    print("Installing hydride package....")
    hydride_src = llvm_src = os.path.join(hydride_root, "code-synthesizer", "hydride")
    if dep_exists('raco'):
        install_cmd = [
            "raco",
            "pkg install",
            hydride_src,
        ]
        install_cmd = " ".join(install_cmd)

        execute(install_cmd)
    else:
        print("Please install Racket and the raco pkg manager")


def main():
    hydride_root = os.getcwd()
    build_halide(hydride_root)
    install_custom_rosette(hydride_root)
    install_hydride_rkt(hydride_root)

if __name__ == "__main__":
    main()