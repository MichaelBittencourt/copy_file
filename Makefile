# You can add commends using this character #

#####################Variables########################

#compiler defifition
GCC=gcc

SRC_FOLDER=src
C_SRC=$(wildcard $(SRC_FOLDER)/*.c)
HEADERS=$(wildcard $(SRC_FOLDER)/*.h)

#OBJ=$(C_SRC:.c=.o)
OBJ_FOLDER=obj
OBJ=$(subst .c,.o,$(subst $(SRC_FOLDER), $(OBJ_FOLDER),$(C_SRC)))
#ASSEMBLY_FILES=$(C_SRC:.c=.s)
ASSEMBLY_FOLDER=assembly
ASSEMBLY_FILES=$(subst .c,.s,$(subst $(SRC_FOLDER), $(ASSEMBLY_FOLDER), $(C_SRC)))
PRE_PROCESSOR_FOLDER=pre_processor
PRE_PROCESSOR_FILES=$(subst $(SRC_FOLDER), $(PRE_PROCESSOR_FOLDER), $(C_SRC))

OTIMIZATION=-O2
DEBUG:=
LD_FLAGS=-std=c99 \
		-W \
		-Werror \
		-Wall \
		-ansi \
		-pedantic

DEFINES:=
INCLUDES:= -I$(SRC_FOLDER)

CC_FLAGS= $(OTIMIZATION) $(DEBUG) $(INCLUDES) $(DEFINES) $(LD_FLAGS)
ASSEMBLER_FLAGS= -S -fno-asynchronous-unwind-tables
PRE_PROCESSOR_FLAGS=-E

BIN=copy

all: objFolder $(BIN)
	@ echo ' '
	@ echo 'Build finish: $(BIN)'

$(BIN): $(OBJ)
	$(GCC) $^ -o $@

$(OBJ_FOLDER)/%.o: $(SRC_FOLDER)/%.c $(SRC_FOLDER)/%.h
	$(GCC) -c $< -o $@ $(CC_FLAGS)

$(OBJ_FOLDER)/main.o: $(SRC_FOLDER)/main.c $(HEADERS)
	$(GCC) -c $< -o $@ $(CC_FLAGS)

$(ASSEMBLY_FOLDER)/%.s: $(SRC_FOLDER)/%.c $(SRC_FOLDER)/%.h
	$(GCC) -c $< -o $@ $(CC_FLAGS)

$(ASSEMBLY_FOLDER)/main.s: $(SRC_FOLDER)/main.c $(HEADERS)
	$(GCC) -c $< -o $@ $(CC_FLAGS)

$(PRE_PROCESSOR_FOLDER)/%.c: $(SRC_FOLDER)/%.c $(SRC_FOLDER)/%.h
	$(GCC) -c $< -o $@ $(CC_FLAGS)

$(PRE_PROCESSOR_FOLDER)/main.c: $(SRC_FOLDER)/main.c $(HEADERS)
	$(GCC) -c $< -o $@ $(CC_FLAGS)

assembly: assemblyFolder assembly_setup $(ASSEMBLY_FILES)

assemblyFolder:
	@ mkdir -p $(ASSEMBLY_FOLDER)

pre_processor: pre_processorFolder pre_processor_setup $(PRE_PROCESSOR_FILES)

pre_processorFolder:
	@ mkdir -p $(PRE_PROCESSOR_FOLDER)

objFolder:
	@ mkdir -p $(OBJ_FOLDER)

.PHONY: all clean debug debug_setup assembly_setup assembly pre_processor_setup pre_processor no_optimization no_optimization_setup help

no_otimization: no_otimization_setup all

no_otimization_setup:
	$(eval OTIMIZATION=-O0)

debug: debug_setup all

debug_setup:
	$(eval DEBUG=-g3)

assembly_setup:
	$(eval CC_FLAGS=${CC_FLAGS} ${ASSEMBLER_FLAGS})

pre_processor_setup:
	$(eval CC_FLAGS=${CC_FLAGS} ${PRE_PROCESSOR_FLAGS})

clean:
	rm -f *~ $(BIN)
	test -e $(OBJ_FOLDER) && rm -f $(OBJ_FOLDER)/*.o && rmdir $(OBJ_FOLDER) || true
	test -e $(ASSEMBLY_FOLDER) && rm -f $(ASSEMBLY_FOLDER)/*.s && rmdir $(ASSEMBLY_FOLDER) || true
	test -e $(PRE_PROCESSOR_FOLDER) && rm -f $(PRE_PROCESSOR_FOLDER)/*.c && rmdir $(PRE_PROCESSOR_FOLDER) || true

help:
	@ echo "Usage:"
	@ echo ""
	@ echo "\tmake -> build normal bynary"
	@ echo "\tmake debug -> build bynary as debug mode"
	@ echo "\tmake pre_processor -> build pre-processed C code"
	@ echo "\tmake assembly -> build assembly code"
	@ echo "\tmake no_optimization -> build without optimization"
	@ echo ""
	@ echo "\t[OBS]: You can conbine these options"
	@ echo "\t\tEg: make assembly debug"
