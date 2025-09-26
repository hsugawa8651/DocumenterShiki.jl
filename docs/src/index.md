
# Hello world

- Hello World!
- ここにはマークダウンで文章を記述してください．

```@example
a = 1
b = 2  # [!code highlight]
a + b
```

```@example
a = 1  # [!code highlight:2]
b = 2
a + b
```


```julia
# @highlight: 1,3-4
println(1)
println(2)
println(3)
println(4)
```

```@example
# @highlight: 1,3-4
println(1)
println(2)
println(3)
println(4)
```

## ハイライトブロックのテスト

```julia
# @highlight-start
println("この行はハイライトされます")
println("この行もハイライトされます")
# @highlight-end
println("この行はハイライトされません")
println("この行もハイライトされません")
```

```@example
println("通常の行")
# @highlight-start
x = 10
y = 20
z = x + y
# @highlight-end
println("結果: ", z)
```

## ネストされたハイライトのテスト

```julia
# 二重ループの例
# @highlight-start[1]
for i in 1:3
    println("外側ループ: ", i)
    # @highlight-start[2]
    for j in 1:2
        println("  内側ループ: ", j)
    end # @highlight-end
    println("外側ループ続き")
end # @highlight-end
println("ループ終了")
```

```@example
# 複雑なネストの例
function process_data(data)
    # @highlight-start[1]
    println("データ処理開始")
    
    # @highlight-start[2]
    # 前処理
    filtered = filter(x -> x > 0, data) # @highlight-end
    
    # @highlight-start[3]
    # メイン処理
    result = map(filtered) do x
        # @highlight-start[4]
        if x % 2 == 0
            x * 2
        else
            x * 3
        end # @highlight-end
    end # @highlight-end
    
    println("データ処理終了") # @highlight-end
    return result
end

# テスト実行
test_data = [-1, 2, 3, 4, 5]
result = process_data(test_data)
println("結果: ", result)
```

## Plotsを使った例

```@example plots
using Plots

# データ生成
x = 0:0.1:2π
y = sin.(x)

# プロット作成
# @highlight-start
p = plot(x, y, 
    label="sin(x)",
    title="Sine and Cosine Waves",
    xlabel="x",
    ylabel="y",
    lw=2,
    color=:blue
)
# @highlight-end

# 余弦波を追加
plot!(x, cos.(x), 
    label="cos(x)",
    lw=2,
    color=:red
)
```