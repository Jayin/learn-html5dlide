FILES = $(ls -A)

main:
	ls


foreach1:
	echo files

# 第一条命令将会保存上下文环境
test1:
	cd src ; pwd
	cd src && pwd

#删除日志文件
clean:    
	-rm *.log

# 创建新的日志文件
create_log: clean
	touch a.log b.log c.log d.log

compile:
	coffee -o dest/ -c src/*.coffee 


.PHONY: main clean foreach1 create_log