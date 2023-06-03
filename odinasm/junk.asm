```
odinasm.bin`odinasm.pt1:
    0x100006e80 <+0>:  movq   %rdi, -0x8(%rsp)
->  0x100006e85 <+5>:  jmp    0x100006e87               ; <+7> at main.odin
    0x100006e87 <+7>:  movq   -0x8(%rsp), %rax
    0x100006e8c <+12>: retq   
```

```
odinasm.bin`odinasm.pt2:
    0x100006e90 <+0>:  movq   %rsi, -0x8(%rsp)
    0x100006e95 <+5>:  movq   %rdi, -0x10(%rsp)
->  0x100006e9a <+10>: jmp    0x100006e9c               ; <+12> at main.odin
    0x100006e9c <+12>: movq   -0x10(%rsp), %rax
    0x100006ea1 <+17>: movq   -0x8(%rsp), %rdx
    0x100006ea6 <+22>: retq   
```

```
odinasm.bin`odinasm.pt3:
    0x100007010 <+0>:  movq   %rsi, -0x8(%rsp)
    0x100007015 <+5>:  movq   %rdi, -0x10(%rsp)
->  0x10000701a <+10>: jmp    0x10000701c               ; <+12> at main.odin
    0x10000701c <+12>: movq   -0x10(%rsp), %rax
    0x100007021 <+17>: movq   -0x8(%rsp), %rdx
    0x100007026 <+22>: retq   
```


```
odinasm.bin`odinasm.pt4:
    0x100007030 <+0>:  movq   %rsi, -0x8(%rsp)
->  0x100007035 <+5>:  jmp    0x100007037               ; <+7> at main.odin
    0x100007037 <+7>:  movq   -0x8(%rsp), %rax
    0x10000703c <+12>: retq   
```


```
odinasm.bin`odinasm.pt5:
    0x100007040 <+0>:  movq   %rsi, -0x8(%rsp)
    0x100007045 <+5>:  movq   %rdi, -0x10(%rsp)
->  0x10000704a <+10>: jmp    0x10000704c               ; <+12> at main.odin
    0x10000704c <+12>: movq   -0x10(%rsp), %rax
    0x100007051 <+17>: movq   -0x8(%rsp), %rdx
    0x100007056 <+22>: retq   
```




