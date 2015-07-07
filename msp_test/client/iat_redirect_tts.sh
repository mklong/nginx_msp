#!/bin/bash
echo "test result :"
curl -H "X-Sub: iat" -H "Connection: close" http://localhost/redirect.do
echo
echo "correct result : <html><frameset>tts "
echo

