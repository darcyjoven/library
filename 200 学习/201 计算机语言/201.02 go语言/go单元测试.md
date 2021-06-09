> 单元测试文件，结尾需要时_test.go
 编译的时候不会编译这些文件

> 根据函数名称可以分为下面几类
> 
|类型|格式|作用|
|:-|:-|:-|
测试函数|函数名前缀为Test|测试程序的一些逻辑行为是否正确
基准函数|函数名前缀为Benchmark|测试函数的性能（执行时间、内存申请情况）
示例函数|函数名前缀为Example|为文档提供示例文档

## 单元测试

> 函数需要导入包`testing`

> 函数名需要以Test开头，参数需要有 `*testing.T`
```go 
func TestAdd(t *testing.T){ ... }
func TestSum(t *testing.T){ ... }
func TestLog(t *testing.T){ ... }
```
