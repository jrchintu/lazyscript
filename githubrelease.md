# METHOD 1 (Recommended)

- Export this first
``` 
export GITHUB_TOKEN="your_token_here"
export TAGVER="0.1"
export FILE="./*.zip"
export MESSAGE="Your changelog here"
```
- Install golang and Release
```
sudo apt install golang -y
go get github.com/github/hub
hub release create -a "$FILE" -m "$MESSAGE" "$TAGVER"
```

# METHOD 2 (Not recommended)

- Export this first
``` 
export GITHUB_TOKEN="your_token_here"
export GITUSER="jrchintu"
export GITREPO="lazyscript"
export TAGVER="0.1"
export FILERENAME="rom.zip"
export FILE="./*.zip"
```
- Install golang and Release
```
sudo apt install golang -y
go get github.com/github-release/github-release
git tag v"$TAGVER" && git push && git push --tags
github-release release -s $GITHUB_TOKEN -u $GITUSER -r $GITREPO -t v"$TAGVER"
github-release upload -s $GITHUB_TOKEN -u $GITUSER -r $GITREPO -t v"$TAGVER" -n $FILERENAME -f $FILE
```
