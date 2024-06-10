# 方便起见一般都会先定义编译器链接器
CC = gcc 
LD = gcc

# 正则表达式表示目录下所有.c文件，相当于：SRCS = main.c a.c b.c
SRCS = $(wildcard *.c)

# OBJS表示SRCS中把列表中的.c全部替换为.o，相当于：OBJS = main.o a.o b.o
OBJS = $(patsubst %.c, %.o, $(SRCS))

# 可执行文件的名字
TARGET = build/main

# .PHONY伪目标，具体含义百度一下一大堆介绍
.PHONY: all clean build

# 要生成的目标文件
all: build $(TARGET)

LDFLAGS = -L/usr/local/lib

# LDLIBS=-lqueue -lllist

# 目标文件的依赖关系和规则
$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)

# 所有 .o 文件由相应名字的 .c 文件生成
%.o: %.c
	$(CC) -c $^

# 创建 build 目录
build:
	mkdir -p build

# make clean 删除所有 .o 和目标文件
clean:
	rm -f $(OBJS) $(TARGET)
	rm -rf build
