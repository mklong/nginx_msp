#!/bin/bash
echo "test result :"
curl -H "X-Sub: iat"  http://localhost/msp.do
echo
echo "correct result : <html><frameset>iat "
echo

