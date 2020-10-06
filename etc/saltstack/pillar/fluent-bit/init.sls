fluent_bit:
  repo:
    version: buster
  user: td-agent-bit
  group: td-agent-bit
  process_name: td-agent-bit
  pkg: td-agent-bit
  agent:
    flush: 5
    daemon: 'Off'
    log_level: info
    parsers_file: parsers.conf.dpkg-dist
    http_server: 'on'
    http_port: 2020
  service: true
  configs:
    inputs:
      settings:
        - type: input
          Name: syslog
          Parser: syslog-rfc5424
          Mode: tcp
          Port: 5140
          Listen: 127.0.0.1
          # Buffer_Chunk_Size:   32000
          # Buffer_Max_Size:   64000
      # syslog input plugin req uires parser configuration
        - type: input
          Name: systemd
          Tag: host.*
          # Systemd_Filter  _SYSTEMD_UNIT=docker.service
          # # Can be defind multiple times
    parsers:
      settings:
      # http://rubular.com/r/tjUt3Awgg4
        - type: parser
          Name: cri
          Format: regex
          Regex: '^(?<time>[^ ]+) (?<stream>stdout|stderr) (?<logtag>[^ ]*) (?<message>.*)$'
          Time_Key: time
          Time_Format: '%Y-%m-%dT%H:%M:%S.%L%z'
    filters:
      settings:
        - type: filters
          Name: grep
          Match: syslog
          Regex: Error
    outputs:
      settings:
        - type: output
          Name: forward
          Match: '*'
          Host: fluentd.host
          Port: 24224
        - type: output
          Name: stdout
          Match: '**'
