FROM ubuntu:18.04
RUN apt update  
RUN apt install git -y
RUN git clone https://github.com/quickfix/quickfix.git
COPY M1.AtomicCount.h ./
RUN cat M1.AtomicCount.h > quickfix/src/C++/AtomicCount.h 
RUN apt install build-essential libtool m4 automake make -y
RUN cd quickfix && ./bootstrap && ./configure && make && make install
