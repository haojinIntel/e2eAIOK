#!/bin/bash

failed_tests=""
echo "Setup pyrecdp latest package"
python setup.py sdist && pip install dist/pyrecdp-*.*.*.tar.gz

echo "test_llmutils.Test_LLMUtils.test_near_dedup"
python -m unittest tests.test_llmutils.Test_LLMUtils.test_near_dedup
if [ $? != 0 ]; then
    failed_tests=${failed_tests}"tests.test_llmutils.Test_LLMUtils.test_near_dedup\n"
fi

echo "test_llmutils.Test_LLMUtils.test_shrink_jsonl"
python -m unittest tests.test_llmutils.Test_LLMUtils.test_shrink_jsonl
if [ $? != 0 ]; then
    failed_tests=${failed_tests}"tests.test_llmutils.Test_LLMUtils.test_shrink_jsonl\n"
fi

echo "test_llmutils.Test_LLMUtils.test_text_to_jsonl"
python -m unittest tests.test_llmutils.Test_LLMUtils.test_text_to_jsonl
if [ $? != 0 ]; then
    failed_tests=${failed_tests}"tests.test_llmutils.Test_LLMUtils.test_text_to_jsonl\n"
fi

if [ -z ${failed_tests} ]; then
    echo "All tests are passed"
else
    echo "*** Failed Tests are: ***"
    echo ${failed_tests}
    exit 1
fi