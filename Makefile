CC = c++

CXXFLAGS = -std=c++17
PROGRAM = out
BIN = bin

SRC = $(wildcard src/main/*.cpp)
OBJ = $(SRC:.cpp=.o)

.PHONY: all clean 

all: dirs libs $(PROGRAM)

run: all
	./$(BIN)/$(PROGRAM)

dirs:
	mkdir -p $(BIN)

libs:
	
$(PROGRAM): $(OBJ)
	$(CC) -o $(BIN)/$(PROGRAM) $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) -o $@ -c $< $(CXXFLAGS)

clean:
	rm -rf $(BIN) $(OBJ)

