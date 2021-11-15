Multi-language, multi-file scripting and deploying.

I have a script

pfr x.txt y.txt z.txt

I want to package up the app into a single bundle that a user can put on the PATH and run.

The script uses multiple languages, like node.js, swipl (PROLOG), bash, etc.  The user might not have all of these language processors installed in the environment. The user might not be running the same O/S as me. 

The script loads various .js file and various .pl (PROLOG) files for its own use, then accesses target files from the user (reads several user files, then outputs to stdout or by writing to a user file).

The script will be used multiple times, for example in a pipeline of commands.

I'm looking at Docker but am open to any solution that works.

I need to be pointed at something that works or something to read (there are too many choices).

(This might be a no-brainer, but I don't know how to search for this).



that uses several languages and loads several source files before running

