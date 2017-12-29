bootstrap-emilien
=================

Bootstrap Emilien's environment with Ansible on latest Fedora.

Requirements
------------

Latest Fedora + latest Ansible.

How to
------

* Deploy a fresh install of latest Fedora.
* Login and launch a terminal.
* Run:

For the client:
```shell
export TYPE=client
```

For the server:

```shell
export TYPE=server
```

And then:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/EmilienM/bootstrap-emilien/master/bootstrap.sh)"
```

Note: running curl + sh isn't secure I know, but this is my own script and I
trust myself enough :-).

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: localhost
      roles:
         - bootstrap-emilien

License
-------

Apache 2.0
