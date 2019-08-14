echo 'Delete all generator file...'
LC_ALL=C find -E . -iregex '.*\.g\.dart$' -delete -print
echo 'Build generator file...'
flutter packages pub run build_runner build