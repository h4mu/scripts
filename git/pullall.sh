for dir in *
do
  test -d "$dir" || continue
  pushd $dir
  git pull
  popd
done
