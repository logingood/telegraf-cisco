# Telegraf Docker container with SNMP

This Dockerfile allows to build a container with snmp-tools, libs and MIBs.

Additionally Cisco MIBs are being downloaded

Based on Dockerfile and scripts from [TIG Stack](https://github.com/matisku/tig-stack)

# Usage

```
git clone git@github.com:murat1985/telegraf-cisco.git
docker build . -t mytelegraf
docker run -dti -n mytelegraf mytelegraf:local
```

Telegraf configuration file contains required SNMP input sources.

Environment variables:
* `SNMP_COMMUNITY` - community string
* `SNMP_AGENTS` - snmp host ip address
* `INFLUXDB_HOST`  - influxdb hostname
* `INFLUXDB_PORT` - influxdb port number
* `DATABASE` - influxdb database nmae
* `HOST_NAME` - hostname
