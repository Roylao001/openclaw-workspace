#!/bin/bash

# Sky Daily Evolution Report
# 每日08:30 自动执行

REPORT_FILE="/Users/roylao/.openclaw/workspace/memory/$(date -v-1d +%Y-%m-%d).md"
OUTPUT_FILE="/Users/roylao/.openclaw/workspace/reports/daily-report-$(date +%Y-%m-%d).md"

echo "=== Sky Daily Evolution Report ===" > "$OUTPUT_FILE"
echo "Date: $(date +%Y-%m-%d\ %H:%M)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 读取昨日记忆
if [ -f "$REPORT_FILE" ]; then
    echo "## Yesterday Session Summary" >> "$OUTPUT_FILE"
    cat "$REPORT_FILE" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
fi

# 生成分析
echo "## Growth Analysis" >> "$OUTPUT_FILE"
echo "- " >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "## Skill Consolidation Suggestions" >> "$OUTPUT_FILE"
echo "- " >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 发送到飞书
openclaw message send --channel feishu --message "$(cat $OUTPUT_FILE)"

echo "Daily report generated and sent!"
