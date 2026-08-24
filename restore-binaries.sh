#!/bin/bash
# Restore binary files from commit 87b9d2a

COMMIT="87b9d2addca073ee622a6dac0e2d765029d243ff"

# List of binary files to restore
FILES=(
  "CV.pdf"
  "favicon.png.png"
  "guix1.jpg"
  "guix2.jpg"
  "guix3.jpg"
  "guix4.jpg"
  "guix5.jpg"
  "talk_palermo.jpg"
  "touring.jpg"
  "assets/CHATS_poster.png"
  "assets/chats_ai.png"
  "assets/chats_ai_fina.jpeg"
  "assets/chats_ai_final.jpeg"
  "assets/toranim.mp4"
  "assets/fontawesome/icons.svg"
  "assets/fonts/License.txt"
  "assets/fonts/PTSans-Bold.woff"
  "assets/fonts/PTSans-Regular.woff"
  "_data/font-awesome/LICENSE.txt"
  "_data/font-awesome/icons.json"
)

echo "Restoring binary files from commit $COMMIT..."

for file in "${FILES[@]}"; do
  echo "Restoring $file..."
  git show $COMMIT:$file > "$file"
done

echo "Done! Binary files have been restored."
echo "Now run: git add . && git commit -m 'Restore binary files from commit 87b9d2a' && git push origin master"
