alpine-pgbouncer
================
Minimalistic pgBouncer container with a small disk footprint (7.835 MB).

|Layers| |Stars| |Pulls|

pgbouncer 1.7.1

I use this to connect apps running in docker images to postgres running on the host using pgbouncer

todo: linking to postgres containers, pool mode selection

Example Usage
-------------

.. code-block::
   docker run --rm -p 6432:6432 -e PG_DBNAME=dbtest -e PG_USER=dbtest -e PG_PASSWD=dbtest -e PG_HOST=192.168.179.1 dafire/alpine-pgbouncer


.. |Stars| image:: https://img.shields.io/docker/stars/gavinmroy/alpine-pgbouncer.svg?style=flat&1
   :target: https://hub.docker.com/r/dafire/alpine-pgbouncer/

.. |Pulls| image:: https://img.shields.io/docker/pulls/gavinmroy/alpine-pgbouncer.svg?style=flat&1
   :target: https://hub.docker.com/r/dafire/alpine-pgbouncer/

.. |Layers| image:: https://img.shields.io/imagelayers/image-size/gavinmroy/alpine-pgbouncer/latest.svg?style=flat&1
   :target: https://hub.docker.com/r/dafire/alpine-pgbouncer/
