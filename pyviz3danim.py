import pyviz3danim
import sys

if __name__ == '__main__':
    if len(sys.argv)>1:
        fileNames=sys.argv[1:]
        pyviz3danim.show(filenames=fileNames)
    else:
        pyviz3danim.show()
