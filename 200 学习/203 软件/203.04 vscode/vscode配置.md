## `task.json` 任务配置
```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build",
            "type": "shell",
            "command": "gcc",
            "args": [
                "'-g'",
                // "'-std=c++17'",  //使用c++17标准编译
                "'${file}'", //当前文件名
                "-o", //对象名，不进行编译优化
                "'${fileBasenameNoExtension}.exe'",  //当前文件名（去掉扩展名）
            ],
            "group": { 
                "kind": "build",
                "isDefault": true   
                // 任务分组，因为是tasks而不是task，意味着可以连着执行很多任务
                // 在build组的任务们，可以通过在Command Palette(F1) 输入run build task来运行
                // 当然，如果任务分组是test，你就可以用run test task来运行 
            },
            // Use the standard MS compiler pattern to detect errors, warnings and infos
            "problemMatcher": [
                "$gcc" // 使用gcc捕获错误
            ]
        }
    ]
}
```

## `launch.json`  debug配置
```json
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
    
        {
            "name": "(gdb) 启动",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/${fileBasenameNoExtension}.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": true,
            "internalConsoleOptions": "neverOpen",
            "MIMode": "gdb",
            "miDebuggerPath": "gdb.exe",
            "setupCommands": [
                {
                    "description": "为 gdb 启用整齐打印",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": false
                }
            ],
            "preLaunchTask": "Build",
        }
    ]
}
```

## `winGM` 配置

下载 其中的 `mingw32-gcc.bin`, `mingw32-gcc-g++.bin`, 以及`mingw32-gdb.bin`。
第一个是c语言文件的编译器，第二个是c++的，第三个是用来调试编译后文件的