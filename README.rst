alpine-pgbouncer
================
Minimalistic pgBouncer container with a small disk footprint.

pgbouncer 1.8.1

I use this to connect apps running in docker images to postgres running on the host using pgbouncer

todo: linking to postgres containers, pool mode selection

Example Usage
-------------

.. code-block::
      docker run --rm -p 6432:6432 -e PG_DBNAME=dbtest -e PG_USER=dbtest -e PG_PASSWD=dbtest -e PG_HOST=192.168.179.1 dafire/alpine-pgbouncer
