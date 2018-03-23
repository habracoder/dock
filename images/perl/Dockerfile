FROM perl:5

ENV PERL5LIB=/home/www/tools

RUN echo Europe/Kiev > /etc/timezone && \
    unlink /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Kiev /etc/localtime

RUN cpanm JSON::XS \
          Net::Netmask \
          DBI \
          Config::INI::Reader \
          Crypt::Rijndael \
          LWP::UserAgent \
          DBD::mysql \
          DateTime \
          Math::Round \
          Proc::ProcessTable \
          AnyEvent

#RUN cpan AnyEvent::Fork AnyEvent::Fork::Pool