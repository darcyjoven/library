```go
package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

var  path  = "G:/worklog"
func walkFunc(path string,os1 os.FileInfo,err error)error{
	//fmt.Println(path)
	a,b:=filepath.Split(path)
	//fmt.Printf(" %v   %v \n",a,b)



	if b =="worklog.md"  {
		a = string([]byte(a)[:len(a)-1])
		c,d :=filepath.Split(a)
		//d是客户名
		c=string([]byte(c)[:len(c)-1])

		e,_:=filepath.Split(c)

		e= string([]byte(e)[:len(e)-1])
		//fmt.Printf("!!! 客户：%v 文件名：%v  e:%v" ,a,b,c,d,e,f)
		fmt.Printf("客户：%v 文件名：%v 文件全部路径：%v \n ",d,b,path)
		pathnew := strings.Replace(path+".md", "worklog.md", d, 2)
		println( os.Rename(path,pathnew))

		//fmt.Println(os)
	}
	return err
}
func main()  {
	 filepath.Walk(path,walkFunc)
	//os.Rename("D:/Io/worklog/a_h/正星/worklog.md","D:/Io/worklog/a_h/正星/worklog1.md")
	 //println(e)
}
```

