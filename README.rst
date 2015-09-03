============
Duo Security
============

`Duo Security <https://www.duosecurity.com/>`_ Duo Unix - Two-Factor Authentication

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``duo.login``
-------------

Installs and configures the *login_duo* package.

``duo.pam``
-----------

Installs and configures the *pam_duo* package.

``duo.pkgrepo``
---------------

Enable the official Duo Security package repository in order to always benefit from the latest version.

``duo.pkgrepo.absent``
----------------------

Undo the effects of ``duo.pkgrepo``.

``Configuration``
=================

Every option available as documented by `Duo Security <https://www.duosecurity.com/docs/duounix#first-steps>`_ can be
set in pillar.

::

    duo:
      config:
        ikey: YOUR_INTEGRATION_KEY
        skey: YOUR_SECRET_KEY
        host: YOUR_API_HOSTNAME
        ...

Adding the pillar data config for the `OpenSSH formula
<https://github.com/saltstack-formulas/openssh-formula>`_ alongside the Duo
formula configuration can easily handle enabling 2FA for sshd.

::

    sshd_config:
      ForceCommand: /usr/sbin/login-duo
      PermitTunnel: False
      AllowTcpForwarding: False
      UseDNS: False
