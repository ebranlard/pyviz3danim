# --- Detecting OS
ifeq '$(findstring ;,$(PATH))' ';'
    detected_OS := Windows
else
    detected_OS := $(shell uname 2>/dev/null || echo Unknown)
    detected_OS := $(patsubst CYGWIN%,Cygwin,$(detected_OS))
    detected_OS := $(patsubst MSYS%,MSYS,$(detected_OS))
    detected_OS := $(patsubst MINGW%,MSYS,$(detected_OS))
endif



all: test


# --- Rules for python app
test:
	python pyviz3danim.py examples/_MT100_SD.dat
# 	python pyviz3danim.py examples/Monopile.SD.sum.yaml

tests:
	python -m unittest discover -v

dep:
	python -m pip install -r requirements.txt

install:
	python setup.py install

installer:
	python -m nsist installer.cfg

# --- Common rules
clean:
	rm -rf __pycache__
	rm -rf *.egg-info
	rm -rf *.spec
	rm -rf build*
	rm -rf dist
