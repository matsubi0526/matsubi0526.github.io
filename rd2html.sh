#!/bin/bash
# 2016-02-07
# created by Fumitaka Matsuba

# 将来的には Makefile による作成を目指すが
# 現在は凝ったことまでできていないので，
# rd2 で直接作成する仕様で我慢している

CSSFILE=test.css
rd2 --r rd/rd2html-ext-lib \
    --out-code=utf-8 \
    --with-css=${CSSFILE} \
    --html-title="Fumitaka Matsuba's Web Page" \
    index.rd > index.html