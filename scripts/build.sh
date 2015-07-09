#!/bin/bash
chmod u+x configure
./configure --prefix=/usr/local/webservices/nginx/ --with-http_ssl_module --add-module=ngx_http_msp_module --with-http_stub_status_module

make 
make install
