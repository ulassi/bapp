g++ -v
g++ -g -Wall -Werror -I ./ -c app.cpp -o build/app.o
g++ -g -Wall -Werror -I ./ -I /System/Library/Frameworks/OpenGL.framework/Headers -framework Cocoa -framework OpenGL -lObjC window.mm -o build/app build/app.o 
