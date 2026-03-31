#!/bin/bash

cd "$(dirname "$0")"

echo "📦 正在添加文件..."
git add .

echo "📝 请输入提交信息 (直接回车使用默认信息):"
read -r commit_msg

if [ -z "$commit_msg" ]; then
    commit_msg="更新文章 - $(date '+%Y-%m-%d %H:%M')"
fi

git commit -m "$commit_msg"

echo "🚀 正在推送到 GitHub..."
git push origin main

echo "✅ 推送完成！"
