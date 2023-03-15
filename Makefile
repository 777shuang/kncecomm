ifeq ($(OUTPUT),)
	OUTPUT=kncecomm
endif
7SWINUTIL=7swinutil

$(OUTPUT).dll: knceappdlg.o kncecapkeydlg.o kncecomm.o kncedirdlg.o kncefiledlg.o kncefontdlg.o kncewaitbox.o kncecomm.res.o $(7SWINUTIL)/$(7SWINUTIL).dll
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -shared -o $@ $^

knceappdlg.o: knceappdlg.cpp kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncecapkeydlg.o: kncecapkeydlg.cpp kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncecomm.o: kncecomm.cpp kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncedirdlg.o: kncedirdlg.cpp kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncefiledlg.o: kncefiledlg.cpp kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncefontdlg.o: kncefontdlg.cpp kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncewaitbox.o: kncewaitbox.cpp  kncecomm.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c $<

kncecomm.res.o:
	arm-mingw32ce-windres kncecomm.res -o $@

$(7SWINUTIL)/$(7SWINUTIL).dll:
	make -C $(7SWINUTIL) --eval=OUTPUT=$(7SWINUTIL)