#!/bin/bash

# Sky Weekly Evolution Report
# 每周一08:30 自动执行

OUTPUT_FILE="/Users/roylao/.openclaw/workspace/reports/weekly-report-$(date +%Y-%m-%d).md"

echo "=== Sky Weekly Evolution Report ===" > "$OUTPUT_FILE"
echo "Week: $(date -v-7d +%Y-%m-%d) to $(date +%Y-%m-%d)" >> "$OUTPUT_FILE"
echo "Generated: $(date +%Y-%m-%d\ %H:%M)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 读取过去7天的记忆
echo "## 7-Day High-Frequency Tasks Review" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 技能学习统计
echo "## Learning Tasks (2/3)" >> "$OUTPUT_FILE"
echo "- " >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 自由探索
echo "## External Trends Exploration (1/3)" >> "$OUTPUT_FILE"
echo "- " >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 发送到飞书
openclaw message send --channel feishu --message "$(cat $OUTPUT_FILE)"

echo "Weekly report generated and sent!"
