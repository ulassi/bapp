g++ -v
g++ -Wall -I ./ -c app.cpp -o build/app.o
g++ -Wall -I ./ -framework Foundation -lObjC window.mm -o build/app build/app.o 
