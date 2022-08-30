func main():
    [ap] = 100; ap++
    [ap] = 200; ap++
    [ap] = [ap -2] + [ap -1]; ap++

    ret
end

