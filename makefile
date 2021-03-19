MAINSRCS := Main.cpp
SRCS := $(wildcard *.cpp Base/*.cpp Log/*.cpp Reactor/*.cpp Thread/*.cpp)
override SRCS := $(filter-out $(MAINSRCS),$(SRCS))
OBJS := $(patsubst %.cpp,%.o,$(SRCS))

TARGET  := WebServer
CC 		:= g++
LIBS 	:= -lpthread
INCLUDE := -I./usr/local/lib 
CFLAGS  := -std=c++11 -g -Wall -O3 -D_PTHREADS
CXXFLAGS:= $(CFLAGS)   


$(TARGET) : $(OBJS) Main.o
	$(CC) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(LIBS)

.PHONY : clean all
clean : 
	find . -name '*.o' | xargs rm -f
all :
	rm WebServer*
