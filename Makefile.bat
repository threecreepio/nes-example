ca65.exe -g --debug-info main.asm -o main.o
ld65.exe --dbgfile "main.dbg" -C layout -o main.nes
