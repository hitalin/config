.PHONY: build

CXX ?= g++
CXXFLAGS = -std=c++14 -Wall -O2 -g
SRCS = main.cpp
build:
	${CXX} ${CXXFALGS} ${SRCS}
