#!/bin/bash

cd "$(dirname "$0")"

echo "🚀 开始构建站点..."
hugo --gc --minify

if [ $? -eq 0 ]; then
    echo "✅ 构建成功！"
    
    echo "📦 正在添加文件..."
    git add .
    
    commit_msg="构建站点 - $(date '+%Y-%m-%d %H:%M')"
    
    git commit -m "$commit_msg"
    
    echo "🚀 正在推送到 GitHub..."
    git push origin main
    
    echo "✅ 推送完成！"
else
    echo "❌ 构建失败！"
    exit 1
fi
