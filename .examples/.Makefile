CC = g++
FLAGS = -std=c++11
LINK_FLAGS = -std=c++11
BINDIR = .

EXTERN_INCLUDE = \

EXTERN_LIBPATH = \

EXTERN_LIBS = \

INCLUDE = \
-I./add/include \
-I./sub/include \

LIBPATH = \

LIBS = \

OBJS = \
$(BINDIR)/add.o \
$(BINDIR)/sub.o \

DEPENDS_main = \
./main.cpp \

DEPENDS_main1 = \
./main1.cpp \

DEPENDS_add = \
./add/src/add.cpp \
./add/include/add.h \

DEPENDS_sub = \
./sub/src/sub.cpp \
./sub/include/sub.h \

all: $(BINDIR)/main.exe $(BINDIR)/main1.exe 

$(BINDIR)/main.exe: $(BINDIR)/main.o $(OBJS)
	$(CC) $(LINK_FLAGS) $(BINDIR)/main.o $(OBJS) -o $(BINDIR)/main.exe $(LIBPATH) $(EXTERN_LIBPATH) $(LIBS) $(EXTERN_LIBS)

$(BINDIR)/main1.exe: $(BINDIR)/main1.o $(OBJS)
	$(CC) $(LINK_FLAGS) $(BINDIR)/main1.o $(OBJS) -o $(BINDIR)/main1.exe $(LIBPATH) $(EXTERN_LIBPATH) $(LIBS) $(EXTERN_LIBS)

$(BINDIR)/main.o: $(DEPENDS_main)
	$(CC) $(FLAGS) $(INCLUDE) $(EXTERN_INCLUDE) -c ./main.cpp -o $(BINDIR)/main.o

$(BINDIR)/main1.o: $(DEPENDS_main1)
	$(CC) $(FLAGS) $(INCLUDE) $(EXTERN_INCLUDE) -c ./main1.cpp -o $(BINDIR)/main1.o

$(BINDIR)/add.o: $(DEPENDS_add)
	$(CC) $(FLAGS) $(INCLUDE) $(EXTERN_INCLUDE) -c ./add/src/add.cpp -o $(BINDIR)/add.o

$(BINDIR)/sub.o: $(DEPENDS_sub)
	$(CC) $(FLAGS) $(INCLUDE) $(EXTERN_INCLUDE) -c ./sub/src/sub.cpp -o $(BINDIR)/sub.o

run: $(BINDIR)/main.exe
	$(BINDIR)/main.exe

run_main: $(BINDIR)/main.exe
	$(BINDIR)/main.exe

run_main1: $(BINDIR)/main1.exe
	$(BINDIR)/main1.exe

clean:
	rm -f $(BINDIR)/*.o
	rm -f $(BINDIR)/main.exe
	rm -f $(BINDIR)/main1.exe

clear:
	rm -f $(BINDIR)/*.o
