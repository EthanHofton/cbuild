CC = c++

CXXFLAGS = -std=c++17
PROGRAM = out
BIN = bin

TARGET = target
SRC = $(wildcard src/main/*.cpp)
OBJ = $(SRC:.cpp=.o)

.PHONY: all clean

all: dirs libs $(PROGRAM)

run: all
	./$(TARGET)/$(BIN)/$(PROGRAM)

dirs:
	mkdir -p $(TARGET)
	mkdir -p $(TARGET)/obj/src
	mkdir -p $(TARGET)/$(BIN)
	cp -Rf src/main $(TARGET)/obj/src

libs:
	
$(PROGRAM): $(TARGET)/obj/$(OBJ)
	$(CC) -o $(TARGET)/$(BIN)/$(PROGRAM) $^ $(LDFLAGS)

$(TARGET)/obj/%.o: %.cpp
	$(CC) -o $@ -c $< $(CXXFLAGS)

clean:
	rm -rf $(TARGET) 
