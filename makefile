CC=g++
CFLAGS=-g -Wall
HEADERS=college.h course.h tarray.h node.h

all: build doc doczip clean

myexe: build

build: college.o collegemain.o course.o
	$(CC) $(CFLAGS) college.o collegemain.o course.o -o myexe

doc: college.cc collegemain.cc course.cc $(HEADERS)
	@doxygen

college.o: college.cc $(HEADERS)
	$(CC) $(CFLAGS) -c college.cc

collegemain.o: collegemain.cc $(HEADERS)
	$(CC) $(CFLAGS) -c collegemain.cc

course.o: course.cc $(HEADERS)
	$(CC) $(CFLAGS) -c course.cc

doczip:
	tar -cvf docs.tar /home/jball/CS3560/Quiz2/html /home/jball/CS3560/Quiz2/latex

clean:
	rm -f *.o *.class *.out
