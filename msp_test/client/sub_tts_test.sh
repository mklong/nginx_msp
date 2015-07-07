#!/bin/bash
echo "test result :"
curl -H "X-Sub: tts"  http://localhost/msp.do
echo
echo "correct result : <html><frameset>tts "
echo

