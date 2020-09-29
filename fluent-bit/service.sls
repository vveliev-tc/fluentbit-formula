# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fluent-bit/map.jinja" import bit with context %}

fluent_bit-configure-{{ bit.pkg }}-service:
  file.managed:
    - name: {{ bit.service.unit }}
    - source: salt://fluent-bit/files/service.{{ grains.init }}.conf.j2
    - template: jinja

fluent_bit-{{ bit.pkg }}-service:
  service.running:
    - name: {{ bit.pkg }}
    - enable: True
    - watch:
      - file: {{ bit.pkg }}-config
      - file: {{ bit.pkg }}-parsers
