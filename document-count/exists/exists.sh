if [ -d /test ]; then
  echo the test folder exists && exit 0
else
  echo the test folder does not exist && exit 1
fi

exit 0
