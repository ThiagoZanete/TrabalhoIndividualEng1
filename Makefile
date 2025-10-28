# Compilador e flags
CXX = g++
CXXFLAGS = -Wall -Iinclude -fPIC

# Diretórios
SRC_DIR = src
BIN_DIR = bin

# Arquivos fonte e objetos
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(patsubst $(SRC_DIR)/%.cpp, $(BIN_DIR)/%.o, $(SRC))

# Alvos principais
TARGET_EXE = $(BIN_DIR)/programa.exe
TARGET_STATIC = $(BIN_DIR)/libprograma.a
TARGET_SHARED = $(BIN_DIR)/libprograma.so
TARGET_DLL = $(BIN_DIR)/libprograma.dll

# Compila todos os binários (executável + bibliotecas)
all: $(TARGET_EXE) $(TARGET_STATIC) $(TARGET_SHARED) $(TARGET_DLL)

# Compila arquivos objeto no diretório bin
$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Cria o executável
$(TARGET_EXE): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET_EXE)

# Cria biblioteca estática (.a)
$(TARGET_STATIC): $(OBJ)
	ar rcs $(TARGET_STATIC) $(OBJ)

# Cria biblioteca compartilhada (.so)
$(TARGET_SHARED): $(OBJ)
	$(CXX) -shared -o $(TARGET_SHARED) $(OBJ)

# Cria DLL (para Windows)
$(TARGET_DLL): $(OBJ)
	$(CXX) -shared -o $(TARGET_DLL) $(OBJ)

# Limpeza dos binários
clean:
	rm -f $(BIN_DIR)/*.o $(BIN_DIR)/*.a $(BIN_DIR)/*.so $(BIN_DIR)/*.dll $(BIN_DIR)/*.exe

# Alvo para compilar testes (opcional, se for usar TDD)
test: all
	$(CXX) $(CXXFLAGS) -o $(BIN_DIR)/testeRegressivo.exe test/*.cpp $(OBJ)
