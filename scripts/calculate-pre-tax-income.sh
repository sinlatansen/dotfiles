#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <after_tax_income>"
    exit 1
fi

after_tax_income=$1

tax_before_income=$(echo "scale=2; ($after_tax_income - 160) / 0.8" | bc)

echo "税前收入: $tax_before_income 元"
