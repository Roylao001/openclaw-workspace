#!/bin/bash

# Sky 每日进化报告生成器
# 用于 Heartbeat 触发

DATE=$(date +%Y-%m-%d)
YESTERDAY=$(date -v-1d +%Y-%m-%d)
REPORT_DIR="/Users/roylao/.openclaw/workspace/reports"
MEMORY_DIR="/Users/roylao/.openclaw/workspace/memory"

mkdir -p "$REPORT_DIR"

# 读取昨日记忆
YESTERDAY_MEM="$MEMORY_DIR/$YESTERDAY.md"

cat > "$REPORT_DIR/daily-$DATE.md" << 'EOF'
# 🦞 Sky 每日进化报告

## 📅 日期
DATE_PLACEHOLDER

---

## 🔍 昨日会话回顾

EOF

if [ -f "$YESTERDAY_MEM" ]; then
    cat "$YESTERDAY_MEM" >> "$REPORT_DIR/daily-$DATE.md"
else
    echo "（昨日无会话记录）" >> "$REPORT_DIR/daily-$DATE.md"
fi

cat >> "$REPORT_DIR/daily-$DATE.md" << 'EOF'

---

## 💡 问题-方案-教训

### 问题识别
- 

### 解决方案
- 

### 经验教训
- 

---

## 📈 成长分析

### 技能进步
- 

### 待提升
- 

---

## 🎯 技能固化提议

### 可固化的技能
- 

### 建议学习
- 

---

*由 Sky 自动生成*
EOF

# 替换日期
sed -i "" "s/DATE_PLACEHOLDER/$DATE/" "$REPORT_DIR/daily-$DATE.md"

echo "✅ 每日报告已生成: $REPORT_DIR/daily-$DATE.md"
