
The no-commit.sh file can be used as a pre-commit hook.  
When any of the files that you want to commit contain the word 'nocommit' the commit will fail.

see this [Blog Post](https://jakemccrary.com/blog/2015/05/31/use-git-pre-commit-hooks-to-stop-unwanted-commits/)

note: when we use npm we can use [husky](https://github.com/typicode/husky) to automatically execute the script as a pre-commit hook.

example:

```
  "pre-commit": "sh ./tools/no-commit.sh"
```