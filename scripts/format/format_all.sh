#! /bin/bash
cd $AAA
find . -name "*.cpp" -o -name "*.hpp" | xargs tools/bin/clang-format -i
