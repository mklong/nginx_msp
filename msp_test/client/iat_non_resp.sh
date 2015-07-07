#!/bin/bash
echo "test result :"
curl -H "X-Sub: iat" -H "Connection: close" http://localhost/non_resp.do
echo
echo "correct result : empty "
echo

