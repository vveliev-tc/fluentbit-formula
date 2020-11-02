================
fluentbit-formula
================

A SaltStack formula that for installing and configuring fluent-bit (td-agent-bit)

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``fluent-bit``
------------

Shortcut for installing the fluent-bit package, configuring the service and configuring fluent-bit.

``fluent-bit.install``
---------------------

Installs the fluent-bit package

``fluent-bit.service``
---------------------

Configures the fluent-bit service with upstart/systemd etc

``fluent-bit.config``
--------------------

Configures fluent-bit input/output plugins
