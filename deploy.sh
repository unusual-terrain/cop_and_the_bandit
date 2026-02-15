#!/bin/bash

# Cop and Bandit Landing Page - Deploy to Production
# This script prepares and deploys the landing page to GitHub Pages

echo "🚀 Preparing for Production Deployment..."

# Remove any remaining .DS_Store files
echo "🧹 Cleaning up system files..."
find . -name ".DS_Store" -delete

# Add all new files
echo "📦 Adding new files..."
git add PRODUCTION_READY.md
git add assets/images/bobby.jpg
git add assets/images/chase.jpg
git add assets/images/daccoit.jpg
git add assets/images/uncatchable.jpg
git add assets/images/screenshot_1.jpg
git add assets/images/screenshot_2.jpg
git add assets/images/screenshot_3.jpg
git add assets/images/screenshot_4.jpg
git add assets/images/logo_transparent.png
git add assets/images/tools.png
git add assets/story_book.pdf

# Add modified files
echo "✏️  Adding modified files..."
git add index.html
git add assets/css/style.css

# Remove deleted files
echo "🗑️  Removing old files..."
git rm assets/images/coin_bronze.png
git rm assets/images/coin_gold.png
git rm assets/images/coin_life.png
git rm assets/images/coin_silver.png
git rm assets/images/skateboard.png
git rm assets/images/ui_icon_audio_off.png
git rm assets/images/ui_icon_audio_on.png
git rm assets/images/ui_icon_booster.png
git rm assets/images/ui_icon_coin.png
git rm assets/images/ui_icon_distance.png

# Show status
echo ""
echo "📊 Current status:"
git status

echo ""
echo "✅ Files staged for commit!"
echo ""
echo "Next steps:"
echo "1. Review the changes above"
echo "2. Run: git commit -m 'Production ready: Complete landing page with all sections'"
echo "3. Run: git push origin main"
echo "4. Visit: https://unusual-terrain.github.io/cop_and_the_bandit/"
echo ""
echo "🎉 Ready to deploy!"
