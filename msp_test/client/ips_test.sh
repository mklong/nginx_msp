#!/bin/bash
echo "test result :"
curl -H "X-Sub: src"  http://localhost/ips.do

echo
echo "correct result : <html><frameset>iat "
echo

