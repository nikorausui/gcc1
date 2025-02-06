#!/bin/bash
assert() {
    expected="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "入力：$input => 答え：$actual"
    else
        echo "入力：$input 正しい答え=> $expected, 実際は $actual"
        exit 1
    fi
}

assert 0 0
assert 42 2

echo OK