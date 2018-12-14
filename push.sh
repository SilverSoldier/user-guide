set -ex
[[ -n "${GITHUB_TOKEN}" ]]
# See https://gist.github.com/willprice/e07efd73fb7f13f917ea
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git add docs/
git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
git remote add github https://${GITHUB_TOKEN}@github.com/kubevirt/user-guide.git || :
# We need to be on master because of `asciibinder package`
git push github master

