FROM telegraf:alpine

MAINTAINER Murat Mukhtarov <muhtarov.mr@gmail.com>

LABEL version="1.0"
LABEL description="Telegraf with snmp libs"

RUN apk add --no-cache curl net-snmp-libs net-snmp net-snmp-tools

RUN curl ftp://ftp.cisco.com/pub/mibs/v2/CISCO-PROCESS-MIB.my -o /usr/share/snmp/mibs/CISCO-PROCESS-MIB.txt
RUN curl ftp://ftp.cisco.com/pub/mibs/v2/CISCO-STP-EXTENSIONS-MIB.my -o /usr/share/snmp/mibs/CISCO-STP-EXTENSIONS-MIB.txt

ADD telegraf.template.conf /telegraf.template.conf

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
