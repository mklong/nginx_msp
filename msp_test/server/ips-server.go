package main

import (
	"fmt"
	"net"
	"os"
)

func main() {
	tcpAddr, err := net.ResolveTCPAddr("tcp4", ":3010") //获取一个tcpAddr
	checkError(err)
	listener, err := net.ListenTCP("tcp", tcpAddr) //监听一个端口
	checkError(err)
	buffer := make([]byte, 4096)

	for {

		conn, err := listener.Accept()

		if err != nil {

			continue

		}

		n, err := conn.Read(buffer)
		Log(conn.RemoteAddr().String(), "receive data string:", string(buffer[:n]))

		resp_buff := "HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Type: text/html;\r\nContent-Length: 16\r\n\r\n<html><frameset>"

		conn.Write([]byte(resp_buff))
		conn.Close()

	}

}

func checkError(err error) {

	if err != nil {

		fmt.Fprintf(os.Stderr, "Fatal error: %s", err.Error())

		os.Exit(1)

	}

}

func Log(v ...interface{}) {
	fmt.Println(v...)
}
