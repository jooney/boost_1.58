all:test client server
LDFLAGS =  -lpthread -llog4cplus #-lboost_log -lboost_system -lboost_thread
INCLUDE = . 
CFLAGS = -g #-DBOOST_LOG_DYN_LINK  #-Wall -ansi
#%.o : %.cpp
#	$(CXX) -I$(INCLUDE) -c -g $<  
#OBJECTS : test.o  client.o server.o  #echo.o
#$(all) : $(OBJECTS) 
#	$(CXX) -o $(TARGET) -g  $(OBJECTS)  -I$(INCLUDE) $(LDFLAGS)



test: test.o
	$(CXX)  test.o -o test $(LDFLAGS) 
test.o: test.cpp
	$(CXX)  $(CFLAGS) -o test.o -c test.cpp 
client: client.o
	$(CXX)  client.o -o client 
client.o: client.cpp
	$(CXX)  -c -g client.cpp
server: server.o
	$(CXX)  server.o -o server
server.o:server.cpp
	$(CXX)  -c -g server.cpp

clean:
	-rm test client server
	-rm *.o
