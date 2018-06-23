FROM perl:5

ENV ANT_VERSION 1.10.1
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

ENV PERL5LIB=/home/www/tools

RUN echo Europe/Kiev > /etc/timezone && \
    unlink /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Kiev /etc/localtime

RUN cpanm JSON::XS
RUN cpanm Net::Netmask
RUN cpanm DBI
RUN cpanm Config::INI::Reader
RUN cpanm Crypt::Rijndael
RUN cpanm LWP::UserAgent
RUN cpanm DBD::mysql
RUN cpanm DateTime
RUN cpanm Math::Round
RUN cpanm Proc::ProcessTable
RUN cpanm Array::Diff
RUN cpanm HTTP::ClickHouse
RUN cpanm Redis
RUN cpanm AnyEvent
RUN cpanm AnyEvent::Fork
RUN cpanm AnyEvent::Fork::Pool
RUN cpanm Devel::Size

# Installs Ant
#RUN cd && \
#    wget -q http://www.us.apache.org/dist//ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
#    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
#    mv apache-ant-${ANT_VERSION} /opt/ant && \
#    rm apache-ant-${ANT_VERSION}-bin.tar.gz