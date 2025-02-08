GOUROU=libgourou

CXXFLAGS = --std=c++17 -DKNOCK_VERSION='"1.3.1"' -I$(GOUROU)/utils -I$(GOUROU)/include \
		   -I$(GOUROU)/lib/pugixml/src
LDFLAGS = $(GOUROU)/libgourou.a $(GOUROU)/lib/updfparser/libupdfparser.a \
		  $(GOUROU)/utils/utils.a -lzip -lcrypto -lz -lcurl

knock: src/knock.o
	cd libgourou && make all BUILD_STATIC=1
	$(CXX) -o $@ $^ $(LDFLAGS)

.PHONY: clean
clean:
	$(MAKE) -C libgourou clean
	rm -f src/knock.o
