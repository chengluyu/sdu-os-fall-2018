# Working Progress of SadPencil <me@pencil.live>

## 第五周

尝试编译只模拟 80386 的、不带 FPU 支持的 bochs。

## 第六周

### 当前进度
尝试对 Bochs 禁用 FPU。
Bochs 编译选项中确实有 disable-fpu 选项，同时需要把 cpu-level 调至 3。
编译报错，大致意思是和 ZMM 寄存器有关。查阅资料知这与 AVX512 指令集有关，由于本项目与 AVX 八杆子打不着，把相关的代码注释后成功编译。
尝试用 Bochs 启动 Linux 0.11 和 Linux 0.12，均失败：黑屏，无任何显示。

### 原因推测
可能的原因一：因为绝大多数人不会关掉 FPU ，因此经历了这么多次版本迭代后， Bochs 的 disable-fpu 选项变成了摆设，已经与源代码起了冲突。
可能的原因二：Bochs 自带的主板 BIOS 或显卡 BIOS 至少其中一个依赖 FPU。

### 退路
退路一：不使用浮点运算相关的指令，而是选择其他未定义的、能引起中断的指令。
退路二：尝试换用其他虚拟机软件。
退路三：换用 ARM 或 MIPS 指令集。